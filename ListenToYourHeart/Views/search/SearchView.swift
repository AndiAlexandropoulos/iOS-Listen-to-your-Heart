//
//  SearchView.swift
//  ListenToYourHeart
//
//  Created by andi a on 23.03.23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchTerm: String = ""
    @State private var selectedEntityType = EntityType.all
    
    @StateObject private var albumListViewModel = AlbumListViewModel()
    @StateObject private var songListViewModel = SongListViewModel()
    @StateObject private var movieListViewModel = MovieListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Select the media", selection: $selectedEntityType) {
                    ForEach(EntityType.allCases) { type in
                        Text(type.name())
                            .tag(type)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                Divider()
                
                if searchTerm.count == 0 {
                    SearchPlaceholderView(searchTerm: $searchTerm)
                        .frame(maxHeight: .infinity)
                }else{
                    
                    switch selectedEntityType {
                    case .all:
                        SearchAllListView(albumListViewModel: albumListViewModel,
                                          songListViewModel: songListViewModel,
                                          movieListViewModel: movieListViewModel)
                        .onAppear {
                            albumListViewModel.searchTerm = searchTerm
                            songListViewModel.searchTerm = searchTerm
                            movieListViewModel.searchTerm = searchTerm
                        }
                    
                            
                    case .album:
                        AlbumListView(viewModel: albumListViewModel)
                            .onAppear {
                                albumListViewModel.searchTerm = searchTerm
                            }
                    case .song:
                        SongListView(viewModel: songListViewModel)
                            .onAppear {
                                songListViewModel.searchTerm = searchTerm
                            }
                    
                    case .movie:
                        MovieListView(viewModel: movieListViewModel)
                            .onAppear {
                                movieListViewModel.searchTerm = searchTerm
                            }

                    }
                }
            }
            .searchable(text: $searchTerm)
            .navigationTitle("Suche")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .onChange(of: selectedEntityType, perform: { newValue in
            updateViewModels(for: searchTerm, selectedEntityType: newValue)
        })
        
        .onChange(of: searchTerm) { newValue in
            updateViewModels(for: newValue, selectedEntityType: selectedEntityType)
        }
    }
    
    func updateViewModels(for searchTerm: String, selectedEntityType: EntityType) {
        switch selectedEntityType {
            case .all:
                albumListViewModel.searchTerm = searchTerm
                songListViewModel.searchTerm = searchTerm
                movieListViewModel.searchTerm = searchTerm
                
            case .album:
                albumListViewModel.searchTerm = searchTerm
                songListViewModel.searchTerm = ""
                movieListViewModel.searchTerm = ""
                
            case .song:
                songListViewModel.searchTerm = searchTerm
                albumListViewModel.searchTerm = ""
                movieListViewModel.searchTerm = ""
                
            case .movie:
                movieListViewModel.searchTerm = searchTerm
                albumListViewModel.searchTerm = ""
                songListViewModel.searchTerm = ""
            }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

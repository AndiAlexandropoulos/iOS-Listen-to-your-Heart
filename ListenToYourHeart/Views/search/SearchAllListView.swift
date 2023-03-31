//
//  SearchAllListView.swift
//  ListenToYourHeart
//
//  Created by andi a on 23.03.23.
//

import SwiftUI

struct SearchAllListView: View {
    
    @ObservedObject var albumListViewModel: AlbumListViewModel
    @ObservedObject var songListViewModel: SongListViewModel
    @ObservedObject var movieListViewModel: MovieListViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                
                HStack {
                    Text("Lieder")
                        .font(.title2)
                    Spacer()
                    NavigationLink {
                        SongListView(viewModel: songListViewModel)
                    } label: {
                        HStack {
                            Text("Siehe alle")
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                .padding()
                
                SongSectionView(songs: songListViewModel.songs)
                
                Divider()
                    .padding(.bottom)
                HStack {
                    Text("Alben")
                        .font(.title2)
                    Spacer()
                    NavigationLink {
                        AlbumListView(viewModel: albumListViewModel)
                    } label: {
                        HStack {
                            Text("Siehe alle")
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                .padding(.horizontal)
                
                AlbumSectionView(albums: albumListViewModel.albums)
                
                Divider()
                    .padding(.bottom)
                HStack {
                    Text("Filme")
                        .font(.title2)
                    Spacer()
                    NavigationLink {
                        MovieListView(viewModel: MovieListViewModel())
                    } label: {
                        HStack {
                            Text("Siehe alle")
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                .padding(.horizontal )
                
                MovieSectionView(movies: movieListViewModel.movies)
                
            }
        }
    }
}
struct SearchAllListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchAllListView(albumListViewModel: AlbumListViewModel.example(), songListViewModel: SongListViewModel.example(), movieListViewModel: MovieListViewModel.example())
    }
}


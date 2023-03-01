//
//  AlbumListView.swift
//  ListenToYourHeart
//
//  Created by andi a on 27.02.23.
//

import SwiftUI

struct AlbumListView: View {
    
    @StateObject var viewModel = AlbumListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.albums) { album in
                    Text(album.collectionName)
                }
                
            switch viewModel.state {
                
                case .good:
                    Color.clear
                        .onAppear {
                            viewModel.loadMore()
                        }
                case .isLoading:
                    ProgressView()
                        .progressViewStyle(.circular)
                        .frame(maxWidth: .infinity)
            case .loadedAll:
                //EmptyView()
                Color.gray
            case .error(let message):
                Text(message)
                    .foregroundColor(.pink)
                }
            }
            .listStyle(.plain)
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Suche Alben")
            }
        }
    }

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}

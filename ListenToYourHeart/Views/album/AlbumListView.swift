//
//  AlbumListView.swift
//  ListenToYourHeart
//
//  Created by andi a on 27.02.23.
//

import SwiftUI

struct AlbumListView: View {
    
   @ObservedObject var viewModel : AlbumListViewModel
    
    var body: some View {
        
            List {
                ForEach(viewModel.albums) { album in
                    NavigationLink {
                        AlbumDetailView (album: album)
                    } label: {
                        AlbumRowView(album: album)
                    }
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
                EmptyView()
                //Color.red
            case .error(let message):
                Text(message)
                    .foregroundColor(.pink)
                }
            }
            .listStyle(.plain)
        }
    }


struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AlbumListView(viewModel : AlbumListViewModel.example() )
        }
    }
}

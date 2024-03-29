//
//  AlbumSearchView.swift
//  ListenToYourHeart
//
//  Created by andi a on 01.03.23.
//

import SwiftUI

struct AlbumSearchView: View {
    
    @StateObject var viewModel = AlbumListViewModel()
    
    var body: some View {
        NavigationView {
          
            Group {
                if  viewModel.searchTerm.isEmpty {
                    SearchPlaceholderView(searchTerm: $viewModel.searchTerm)
                } else {
                    AlbumListView(viewModel: viewModel)
                }
            }
                    
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Suche Alben")
            }
        }
}

struct AlbumSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSearchView()
    }
}

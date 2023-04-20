//
//  MovieSearchListView.swift
//  ListenToYourHeart
//
//  Created by andi a on 22.03.23.
//

import SwiftUI

struct MovieSearchListView: View {
    
    @State private var viewModel = MovieListViewModel()
    
    var body: some View {
        NavigationView {
            
            Group {
                    MovieListView(viewModel: viewModel)
            }
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Filme")
        }
    }
}

struct MovieSearchListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchListView()
    }
}

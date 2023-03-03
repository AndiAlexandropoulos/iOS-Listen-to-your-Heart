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
                    AlbumPlaceholderView(searchTerm: $viewModel.searchTerm)
                } else {
                    AlbumListView(viewModel: viewModel)
                }
            }
                    
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Suche Alben")
            }
        }
}

struct AlbumPlaceholderView : View {
    
    @Binding var searchTerm: String
    let suggestions = ["rammstein", "michael jackson", "maneskin"]
    
    var body: some View {
        VStack (spacing: 15){
            
            Text("Trending")
                .font(.title2)
            
            ForEach(suggestions, id: \.self) { text in
                Button {
                    searchTerm = text
                } label: {
                    Text(text)
                }
            }
        }
    }
}
struct AlbumSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSearchView()
    }
}

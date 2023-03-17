//
//  VideoListView.swift
//  ListenToYourHeart
//
//  Created by andi a on 03.03.23.
//

import SwiftUI

struct VideoListView: View {
    
    @ObservedObject var viewModel : VideoListViewModel
     
     var body: some View {
         
             List {
                 ForEach(viewModel.videos) { video in
                     Text(video.trackName)
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
         }

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}

//
//  ContentView.swift
//  ListenToYourHeart
//
//  Created by andi a on 10.01.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            AlbumSearchView()
                .tabItem {
                    Label("Albums", systemImage: "music.note")
                }
            
            MovieSearchListView()
                .tabItem {
                    Label("Movies", systemImage: "tv")
                }
        }
          
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


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
            
            SearchView()
                .tabItem {
                    Label("Suche", systemImage: "magnifyingglass")
                }
            
            AlbumSearchView()
                .tabItem {
                    Label("Alben", systemImage: "music.note")
                }
            
            MovieSearchListView()
                .tabItem {
                    Label("Filme", systemImage: "tv")
                }
            
            ChatConversationView()
                .tabItem {
                    Label("Chats", systemImage: "paperplane")
                }
        }
          
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


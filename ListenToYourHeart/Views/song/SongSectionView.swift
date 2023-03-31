//
//  SongSectionView.swift
//  ListenToYourHeart
//
//  Created by andi a on 28.03.23.
//

import SwiftUI

struct SongSectionView: View {
    
    let songs: [Song]
    let rows = Array(repeating: GridItem(.fixed(60), alignment: .leading),
                     count: 5)
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 15) {
                
                ForEach(songs) { song in
                    NavigationLink {
                        SongDetailView(song:song)
                    } label: {
                        SongRowView(song: song)
                            .frame(width: 300)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

struct SongSectionView_Previews: PreviewProvider {
    static var previews: some View {
        SongSectionView(songs: [Song.example()])
    }
}

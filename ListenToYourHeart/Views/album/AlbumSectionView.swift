//
//  AlbumSectionView.swift
//  ListenToYourHeart
//
//  Created by andi a on 28.03.23.
//

import SwiftUI

struct AlbumSectionView: View {
    
    let albums: [Album]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack (alignment: .top) {
                ForEach(albums) { album in
                    VStack (alignment: .leading){                      ImageLoadingView(urlString: album.artworkUrl100, size: 100)
                        Text(album.collectionName)
                        Text(album.artistName)
                    }
                    .lineLimit(2)
                    .frame(width: 100)
                    .font(.caption)
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

struct AlbumSectionView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSectionView(albums: [Album.example()])
    }
}

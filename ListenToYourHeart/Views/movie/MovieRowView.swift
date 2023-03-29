//
//  MovieRowView.swift
//  ListenToYourHeart
//
//  Created by andi a on 27.03.23.
//

import SwiftUI

struct MovieRowView: View {
    
    let movie: Movie
    
    var body: some View {
        HStack {
            ImageLoadingView(urlString: movie.artworkUrl100, size: 100)
            
            VStack(alignment: .leading) {
                Text(movie.trackName)
                Text(movie.primaryGenreName)
                    .foregroundColor(.gray)
                Text(movie.releaseDate)
                    
            }
            .font(.caption)
            Spacer(minLength: 20)
            
            BuyButton(urlString: movie.previewURL ?? "",
                      price: movie.trackPrice,
                      currency: movie.currency)
        }
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: Movie.example())
    }
}

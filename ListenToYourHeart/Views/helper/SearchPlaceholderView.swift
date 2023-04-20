//
//  SearchPlaceholderView.swift
//  ListenToYourHeart
//
//  Created by andi a on 24.03.23.
//

import SwiftUI

struct SearchPlaceholderView : View {
    
    @Binding var searchTerm: String
    let suggestions = ["madonna", "the gap band", "roisin murphy"]
    
    var body: some View {
        VStack (spacing: 15){
            
            Text("Letzte Suchen")
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
struct SearchPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPlaceholderView(searchTerm: .constant("John"))
    }
}

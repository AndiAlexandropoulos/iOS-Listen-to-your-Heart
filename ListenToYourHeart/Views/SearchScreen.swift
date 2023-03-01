//
//  SearchScreen.swift
//  ListenToYourHeart
//
//  Created by andi a on 09.02.23.
//

import SwiftUI

struct SearchScreen: View {
    var body: some View {
        VStack {
            Text("Suche")
                .padding()
            
            AlbumListView()
        }
    }
}


struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}

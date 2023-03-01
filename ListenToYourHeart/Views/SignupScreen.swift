//
//  SignupScreen.swift
//  ListenToYourHeart
//
//  Created by andi a on 10.01.23.
//

import SwiftUI

struct SignupScreen: View {
    var body: some View {
        ZStack{
            Image("BgBlack")
                .aspectRatio( contentMode: .fit)
            Image("WhiteTextBlackLogo")
                .opacity(0.25)
        }
    }
}

struct SignupScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignupScreen()
    }
}

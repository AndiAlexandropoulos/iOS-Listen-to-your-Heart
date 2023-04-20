//
//  LoginScreen.swift
//  ListenToYourHeart
//
//  Created by andi a on 10.01.23.
//

import SwiftUI

struct LoginScreen: View {
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        ZStack{
            Image("BgBlack")
                .aspectRatio( contentMode: .fit)
            Image("LogothickFinalTransparent")
                .opacity(0.2)
            VStack{
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Passwort", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button(action:{
                    
                }){
                    Text("Log in")
                        .foregroundColor(Color.white)
                                                    
                }
                Button(action:{
                    
                }){
                    Text("Cancel")
                        .foregroundColor(Color.white)
                                                    
                }
            }
        }
    }
}

    struct LoginScreen_Previews: PreviewProvider {
        static var previews: some View {
            LoginScreen()
        }
    }


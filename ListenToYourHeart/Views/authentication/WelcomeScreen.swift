//
//  WelcomeScreen.swift
//  ListenToYourHeart
//
//  Created by andi a on 10.01.23.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        ZStack{
            Image("BgBlack")
                .aspectRatio( contentMode: .fit)
            
            Image("b")
                .opacity(0.2)
                
            VStack(alignment: .leading){
                
                Text("Welcome to")
                    .foregroundColor(Color.white)
                    .font(Font.system(.largeTitle))
                    .padding()
                
                    
                Text("Listen")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .font(Font.system(.largeTitle))
                    .multilineTextAlignment(.leading)
                    
                 
                
                Text("to your")
                    .font(.footnote)
                    .foregroundColor(Color.white)
                    
                Text("Heart")
                    .foregroundColor(Color.white)
                    .font(Font.system(.largeTitle))
                
                Text("by LoveLists")
                    .font(.caption)
                    .fontWeight(.thin)
                    .foregroundColor(Color.white)
                    
                
            
                
                
                    Button(action:{
                        
                    }){
                        Text("Log in ")
                                                        
                    }
                    .foregroundColor(Color.white)
                    .padding(9)
                    .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.purple, lineWidth: 3))
                    .padding()
                    
                    
                    
                    Button(action:{
                        
                    }){
                        Text("Sign in")
                            
                    }
                    .foregroundColor(Color.white)
                    .padding(9)
                    .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.green, lineWidth: 3))
                    
                    .padding()
    
            }
            
        }
    }
        struct WelcomeScreen_Previews: PreviewProvider {
            static var previews: some View {
                WelcomeScreen()
            }
        }
    }


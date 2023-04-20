//
//  LoginView.swift
//  ListenToYourHeart
//
//  Created by andi a on 17.04.23.
//

import SwiftUI

struct LoginView: View {
    
    @State var isLoginMode = false
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack(spacing: 16) {
                    
                    Picker(selection: $isLoginMode, label: Text("Picker here")) {
                        Text("Einloggen")
                            .tag(true)
                        Text("Konto erstellen")
                            .tag(false)
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    if !isLoginMode {
                    
                    Button {
                        
                    }label: {
                        Image(systemName: "person.fill")
                            .font(.system(size: 64))
                            .padding()
                    }
                }
                
                    Group {
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                           
                        SecureField("Passwort", text: $password)
                    }
                    .padding(12)
                    .background(.white)
                    
                    Button {
                        handleAction()
                    } label: {
                        HStack {
                            Spacer()
                            Text(isLoginMode ? "Einloggen" : "Konto erstellen")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()
                        }.background(isLoginMode ? Color.indigo : Color.blue)
                            .cornerRadius(4)
                    }
                }
                .padding()
                
                }
            .navigationTitle(isLoginMode ? "Einloggen" : "Erstelle dein Konto")
            .background(Color(.init(white: 0, alpha: 0.05))
                .ignoresSafeArea())
                        
            }
        }
    
    private func handleAction() {
        if isLoginMode {
            print("Should log into Firebase with existing credentials")
        } else {
            print("Register a new account inside of Firebase Auth and then store image in Storage somehow...")
        }
    }
}
    
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

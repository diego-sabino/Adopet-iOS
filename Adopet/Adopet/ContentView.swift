//
//  ContentView.swift
//  Adopet
//
//  Created by Diego Sabino on 06/05/23.
//

import SwiftUI
import Inject

struct ContentView: View {
    @ObservedObject private var iO = Inject.observer
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                Image("MainLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 20)
                    
                VStack(spacing: 10) {
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
                .shadow(radius: 5)
                .padding(.horizontal, 20)
                
                Spacer().frame(height: 125)
                
                Button(action: {}) {
                    Text("Login")
                        .frame(width: 300, height: 50)
                        .background(Color("MainButton"))
                        .foregroundColor(.white)
                        .font(.title3)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                
                Button(action: {}) {
                    Text("Don't have an account? Sign Up")
                        .frame(width: 300, height: 50)
                        .foregroundColor(Color("MainButton"))
                        .font(.callout)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
        }
        .enableInjection()
    }
}

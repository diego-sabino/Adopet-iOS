//
//  LoginView.swift
//  Adopet
//
//  Created by Diego Sabino on 06/05/23.
//

import SwiftUI
import Inject

struct LoginView: View {
    @ObservedObject private var iO = Inject.observer
    
    @State var email: String = ""
    @State var password: String = ""
    @State var rememberMe: Bool = false
    @State private var isLogged: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Image("MainLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 225, alignment: .top)
                        .padding(.bottom, 5)
                    
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
                    .padding(.bottom, 70)
                    
                    Spacer()
                    
                    NavigationLink(destination: FeedView()) {
                        Text("Login")
                            .frame(width: 310, height: 50)
                            .background(Color("MainButton"))
                            .foregroundColor(.white)
                            .font(.title3)
                            .cornerRadius(10)
                            .shadow(radius: 10)
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
        }
        .enableInjection()
    }
}

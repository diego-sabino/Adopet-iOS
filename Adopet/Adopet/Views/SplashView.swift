//
//  SplashView.swift
//  Adopet
//
//  Created by Diego Sabino on 07/05/23.
//

import SwiftUI
import Inject


struct SplashView: View {
    @ObservedObject private var iO = Inject.observer
    
    var body: some View {
        NavigationView {
            VStack {
                Image("SplashBackground")
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                    .padding(.bottom, 50)
                    .edgesIgnoringSafeArea(.top)
                
                Text("Find Your ")
                    .font(.system(size: 30))
                    .fontWeight(.semibold) +
                Text("New Friend")
                    .font(.system(size: 30))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("SplashButton")) +
                Text(" Here")
                    .font(.system(size: 30))
                    .fontWeight(.semibold)

                
                Spacer().frame(height: 30)
                
                Text("Join us and discover the best\n pet in your location")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                HStack {
                    /* Button("Sign Up") {}
                    .frame(width: 170, height: 63)
                    .background(.white)
                    .font(.system(size: 23))
                    .foregroundColor(Color("SplashButton"))
                    .cornerRadius(10)
                    .shadow(radius: 8)
                    */
                    NavigationLink(destination: FeedView()) {
                        Text("Continue")
                        .frame(width: 200, height: 63)
                        .background(Color("SplashButton"))
                        .font(.system(size: 23))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 8)
                    }
                }
                Spacer()
            }
            .background(Color("SplashBackground"))
            .edgesIgnoringSafeArea(.all)
        }
        .enableInjection()
    }
}

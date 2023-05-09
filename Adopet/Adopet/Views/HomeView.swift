//
//  HomeView.swift
//  Adopet
//
//  Created by Diego Sabino on 08/05/23.
//

import SwiftUI
import Inject

struct HomeView: View {
    @ObservedObject private var injectorObserver = Inject.observer
    
    let petCategories = [
        ("CatIcon", "Cat"),
        ("DogIcon", "Dog"),
        ("TurtleIcon", "Turtle"),
        ("RabbitIcon", "Rabbit")
    ]
    
    var body: some View {
        VStack {
            HeaderView()
            
            Image("HomeBanner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.vertical)
                .padding(.horizontal, 6)
            
            VStack {
                Text("Pet Category")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                ScrollView (.horizontal) {
                    HStack {
                        ForEach(petCategories, id: \.0) { category in
                            petCategoryHStack(imageName: category.0, text: category.1)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
            
            Spacer()
            
            Text("Home page")
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .enableInjection()
    }
    
    func petCategoryHStack(imageName: String, text: String) -> some View {
        HStack(spacing: -5) {
            Image(imageName)
                .resizable()
                .frame(width: 30, height: 30)
                .padding(3)
            Text(text)
                .padding(5)
                .padding(.horizontal, 8)
        }
        .background(Color("SplashButton"))
        .cornerRadius(32)
        
    }
}


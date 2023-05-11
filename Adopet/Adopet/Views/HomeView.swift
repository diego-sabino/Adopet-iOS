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
    
    @State private var selectedCategoryIndex: Int? = nil
    @State private var data: [Pet] = []
    private let apiManager = APIManager()
    
    let petCategories = [
        ("CatIcon", "Cat"),
        ("DogIcon", "Dog"),
        ("TurtleIcon", "Turtle"),
        ("HamsIcon", "Hams")
    ]
    
    var body: some View {
        VStack {
            HeaderView()
            
            Image("HomeBanner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 5)
                .padding(.horizontal, 6)
            
            VStack {
                Text("Pet Category")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(petCategories.indices, id: \.self) { index in
                            petCategoryHStack(index: index)
                                .onTapGesture {
                                    selectedCategoryIndex = index
                                }
                                .background(selectedCategoryIndex == index ? Color("SplashButton"): Color.clear)
                                .cornerRadius(32)
                        }
                    }
                    
                    .padding(.horizontal)
                }
                
            }
            .offset(y: -25)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(data.prefix(2), id: \._id) { item in
                        PetCardView(pet: item)
                            .frame(width: 270, height: 300)
                            .background(.white)
                            .foregroundColor(.gray)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .padding(.horizontal)
                    }
                }
            }
 
            HStack {
                Image(systemName: "house")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 25)
                
                Spacer()
                
                Image(systemName: "plus.app")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 25)
                
                Spacer()

                Image(systemName: "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 25)
            }
            .padding(.horizontal, 60)
            
        }
        .onAppear { fetchData() }
        .navigationBarBackButtonHidden(true)
        .enableInjection()
    }
    
    func petCategoryHStack(index: Int) -> some View {
        let category = petCategories[index]
        
        return HStack(spacing: -5) {
            Image(category.0)
                .resizable()
                .frame(width: 30, height: 30)
                .padding(3)
            Text(category.1)
                .padding(5)
                .padding(.horizontal, 8)
        }
        .cornerRadius(32)
    }
      func fetchData() {
          apiManager.fetchData { result in
              if let result = result {
                  DispatchQueue.main.async {
                      self.data = result
                  }
              }
          }
      }
}

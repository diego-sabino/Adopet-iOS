//
//  FeedView.swift
//  Adopet
//
//  Created by Diego Sabino on 06/05/23.
//

import SwiftUI
import Inject

struct FeedView: View {
    @ObservedObject private var iO = Inject.observer
    
    @State var email: String = ""
    @State var password: String = ""
    @State private var data: [Pet] = []
    private let apiManager = APIManager()
    
    var body: some View {
            VStack(spacing: 0) {
                HeaderView()
                    .background(Color("BackgroundDefault"))
                
                List(data, id: \._id) { item in
                    PetCardView(pet: item)
                        .background(Color("BackgroundCard"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.vertical)
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                        .padding(.horizontal)
                }
                .listStyle(PlainListStyle())
                .scrollContentBackground(.hidden)
                .onAppear { fetchData() }
            }
            .navigationBarBackButtonHidden(true)
            .enableInjection()
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

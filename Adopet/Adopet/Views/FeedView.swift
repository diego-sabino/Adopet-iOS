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
        ZStack {
            List(data, id: \._id) { item in
                Text(item.name)
                AsyncImage(url: URL(string: item.photos[0])) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit) } placeholder: { Color.gray }
                    .listRowInsets(EdgeInsets())
                    .cornerRadius(10)
            }
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

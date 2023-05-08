//
//  HeaderView.swift
//  Adopet
//
//  Created by Diego Sabino on 07/05/23.
//

import SwiftUI
import Inject

struct HeaderView: View {
    @ObservedObject private var iO = Inject.observer
    
    @State var search: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "line.horizontal.3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 12)
                
                Spacer()
                
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 25)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 7)
            
            VStack {
                TextField("Search..", text: $search)
                    .frame(height: 45)
                    .font(.system(size: 15))
                    .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                    )
                    .background(Color("GrayColor"))
                    .cornerRadius(8)
            }
            .opacity(0.8)
            .padding(.horizontal)
            .padding(.top, 10)
            
        }
        .enableInjection()
    }
}


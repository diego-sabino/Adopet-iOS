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
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "line.horizontal.3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 12)
                
                Spacer()
                
                Text("Home")
                    .font(.custom("Avenir Light", size: 22))
                
                Spacer()
                
                Image(systemName: "plus.app")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 20)
            }
            .padding(.horizontal)
            .padding(.bottom, 7)
        }
        .enableInjection()
    }
}


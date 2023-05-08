//
//  HomeView.swift
//  Adopet
//
//  Created by Diego Sabino on 08/05/23.
//

import SwiftUI
import Inject

struct HomeView: View {
    @ObservedObject private var iO = Inject.observer
    
    var body: some View {
        VStack {
            HeaderView()
            
            Spacer()
            
            Text("Home page")
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .enableInjection()
    }
}


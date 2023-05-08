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
    
    
    var body: some View {
        NavigationView {
            //LoginView()
            SplashView()
        }
        .enableInjection()
    }
}

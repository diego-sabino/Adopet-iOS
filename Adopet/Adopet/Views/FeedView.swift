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
    
    var body: some View {
           NavigationView {
               VStack {
                   Text("Hello, World!")
               }
           }
           .navigationBarBackButtonHidden(true)
           .enableInjection()
       }
   }

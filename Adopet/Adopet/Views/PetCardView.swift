//
//  PetCardView.swift
//  Adopet
//
//  Created by Diego Sabino on 06/05/23.
//

import SwiftUI
import Inject

struct PetCardView: View {
    @ObservedObject private var iO = Inject.observer
    
    let pet: Pet
    
    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: URL(string: pet.photos[0])) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.gray
            }
            
            VStack {
                HStack {
                    Text(pet.name)
                        .font(.title)
                    
                    Spacer()
                    
                    Text(pet.sex.capitalized)
                }
                .padding(.vertical, 5)
                
                HStack {
                    Text(pet.state)
                    
                    Spacer()
                    
                    Text(pet.years)
                }
                .padding(.vertical, 5)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        
        .enableInjection()
    }
}

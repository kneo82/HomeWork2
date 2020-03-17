//
//  RecipeProccessView.swift
//  HomeWork2
//
//  Created by Vitaliy Voronok on 17.03.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

struct RecipeProccessView: View {
    let recipe: Recipe
    
    var body: some View {
        HStack {
            NavPopButton(destination: .previous) {
                Text("< Back")
                    .font(.subheadline)
                    .foregroundColor(.blue)
                
                Spacer()
                
                NavPopButton(destination: .root) {
                    Text("To Root View")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
            }
        }
        .padding(20)
        
    }
}

//
//  RecipeView.swift
//  HomeWork2
//
//  Created by Vitaliy Voronok on 16.03.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

struct RecipeView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            NavPopButton(destination: .previous) {
                Text("< Back")
            }
            
            
            Text(recipe.title?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
                .font(.title)
            Spacer()
            Text(recipe.ingredients ?? "")
            
            NavPushButton(destination: RecipeView(recipe: self.recipe)) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.blue)
                    
                        Text("Next >")
                            .font(.headline)
                }
                .frame(width: 150, height: 33, alignment: .center)
                
            }
            
            Spacer()
        }
    }
}


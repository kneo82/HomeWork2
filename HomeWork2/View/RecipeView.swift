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
        VStack {
            HStack {
                NavPopButton(destination: .previous) {
                    Text("< Back")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                    Spacer()
                    
                    Text("Ingredients")
                        .font(.subheadline)
                    
                    Spacer()
                    
                    NavPushButton(destination: RecipeProccessView(viewModel: CookRecipeModel(recipe: self.recipe))) {
                        Text("Recipe >")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding(20)
            
            VStack(alignment: .center) {
                Text(recipe.title?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
                    .font(.title)
            }
            .padding(20)
            
            List(self.ingredients()) { item in
                Text(item)
            }
        }
    }
    
    private func ingredients() -> [String] {
        if let ingredients = recipe.ingredients {
            return ingredients.split(separator: ",").map {
                String($0)
            }
        } else {
            return [""]
        }
    }
}

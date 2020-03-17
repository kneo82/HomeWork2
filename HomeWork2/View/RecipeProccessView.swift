//
//  RecipeProccessView.swift
//  HomeWork2
//
//  Created by Vitaliy Voronok on 17.03.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

struct RecipeProccessView: View {
    @ObservedObject var viewModel: CookRecipeModel
    
    var body: some View {
        VStack {
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
            
            if self.viewModel.parsedRecipe == nil {
                Spacer()
                Text("Loading...")
                Spacer()
            } else {
                Text(self.viewModel.parsedRecipe?.title ?? "Not Found")
                    .font(.title)
                    .padding(20)
                Text(self.viewModel.parsedRecipe?.instructions ?? "Not Found")
                    .font(.body)
                    .padding(20)
                Spacer()
            }
        }
    }
}

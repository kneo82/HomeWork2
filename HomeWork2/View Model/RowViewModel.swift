//
//  RowViewModel.swift
//  HomeWork2
//
//  Created by Vitaliy Voronok on 02.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation
import RecipePuppyAPI

final class RowViewModel: ObservableObject {
    @Published var recipeViewModel: RecipeViewModel
    @Published var item: Recipe
    
    var isLast: Bool {
        recipeViewModel.items.isLast(item)
    }
    
    var isPageLoading: Bool {
        recipeViewModel.isPageLoading
    }
    
    init(recipeViewModel: RecipeViewModel, item: Recipe) {
        self.recipeViewModel = recipeViewModel
        self.item = item
    }
}

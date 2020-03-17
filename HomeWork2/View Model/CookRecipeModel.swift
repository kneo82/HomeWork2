//
//  CookRecipe.swift
//  HomeWork2
//
//  Created by Vitaliy Voronok on 17.03.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

final class CookRecipeModel: ObservableObject {
    private let host = "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
    private let apiKey = "49515c1d30mshbd64ee0fbe44bcep129b4ajsn4601ba0ff3f3"
    
    @Published private(set) var parsedRecipe: ParsedRecipe?
    @Published private(set) var isPageLoading: Bool = false
    
    private let recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
        self.loadPage()
    }
    
    private func loadPage() {
        guard isPageLoading == false else {
            return
        }
        
        isPageLoading = true
        
        ParserecipeAPI.getRecipe(requestUrl: recipe.href ?? "",
                                 xRapidapiHost: host,
                                 xRapidapiKey: apiKey) { responce, error in
                                    if let result = responce {
                                        self.parsedRecipe = result
                                        self.isPageLoading = false
                                    }
        }
    }
}

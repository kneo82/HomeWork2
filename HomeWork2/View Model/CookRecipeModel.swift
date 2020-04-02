//
//  CookRecipe.swift
//  HomeWork2
//
//  Created by Vitaliy Voronok on 17.03.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation
import NutrilonParseApi
import RecipePuppyAPI

final class CookRecipeModel: ObservableObject {
    
    @Published private(set) var parsedRecipe: ParsedRecipe?
    @Published private(set) var isPageLoading: Bool = false
    
    private let recipe: Recipe
    private var serviceLocator: ServiceLocator?
    
    init(serviceLocator: ServiceLocator?, recipe: Recipe) {
        self.serviceLocator = serviceLocator
        self.recipe = recipe
        self.loadPage()
    }
    
    private func loadPage() {
        guard isPageLoading == false else {
            return
        }
        
        isPageLoading = true
        
        if let service = serviceLocator?.getServiceOf(ParseRecipeServise.self)  {
            service.parseRecipe(recipyURL: recipe.href ?? "", handler: { [weak self] parsedRecipe in
                self?.parsedRecipe = parsedRecipe
                self?.isPageLoading = false
            })
        }
    }
}

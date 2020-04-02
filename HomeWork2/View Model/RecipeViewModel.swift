//
//  RecipeViewModel.swift
//  HomeWork2
//
//  Created by Vitaliy Voronok on 16.03.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation
import RecipePuppyAPI

extension Recipe: Identifiable {
    public var id: String {
        self.title ?? UUID().uuidString
    }
}

final class RecipeViewModel: ObservableObject {
    @Published private(set) var items: [Recipe] = [Recipe]()
    @Published private(set) var isPageLoading: Bool = false
    
    private var serviceLocator: ServiceLocator?
    private let request: RecipeRequestModel
    
    init(serviceLocator: ServiceLocator?, recipeRequest: RecipeRequestModel) {
        self.request = recipeRequest
        self.serviceLocator = serviceLocator
    }
    
    func loadPage() {
        guard isPageLoading == false else {
            return
        }
        
        isPageLoading = true
        
        if let service = serviceLocator?.getServiceOf(GetRecipeListService.self)  {
            service.getNextPageRecipe(ingridients: request.ingridients, query: request.query, handler: { [weak self] recipes in
                self?.items.append(contentsOf: recipes)
                self?.isPageLoading = false
            })
        }
    }
}

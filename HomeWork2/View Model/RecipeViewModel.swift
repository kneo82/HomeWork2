//
//  RecipeViewModel.swift
//  HomeWork2
//
//  Created by Vitaliy Voronok on 16.03.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation


extension Recipe: Identifiable {
    public var id: String {
        self.title ?? UUID().uuidString
    }
}

final class RecipeViewModel: ObservableObject {
    @Published private(set) var items: [Recipe] = [Recipe]()
    @Published private(set) var page: Int = 0
    @Published private(set) var isPageLoading: Bool = false
    
    private let request: RecipeRequestModel
    
    init(recipeRequest: RecipeRequestModel) {
        self.request = recipeRequest
    }
    
    func loadPage() {
        guard isPageLoading == false else {
            return
        }
        
        isPageLoading = true
        page += 1
        
        RecipeAPI.getRecipe(i: request.ingridients, q: request.query, p: page) { responce, error in
            if let results = responce?.results {
                self.items.append(contentsOf: results)
                self.isPageLoading = false
            }
        }
    }
}

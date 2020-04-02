//
//  GetRecipeListService.swift
//  HomeWork2
//
//  Created by Vitaliy Voronok on 02.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation
import RecipePuppyAPI

final class GetRecipeListService {
    private var page = 0
    
    func getNextPageRecipe(ingridients: String, query: String, handler: @escaping ([Recipe]) -> Void) {
        page += 1
        
        RecipeAPI.getRecipe(i: ingridients, q: query, p: page) { (responce, error) in
            if let results = responce?.results  {
                handler(results)
            } else if let error = error {
                print("Parse Recipe failed with error: \(error.localizedDescription)")
                print(error.localizedDescription)
                handler([Recipe]())
            }
        }
    }
    
}

//
//  ParseRecipeServise.swift
//  HomeWork2
//
//  Created by Vitaliy Voronok on 02.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation
import NutrilonParseApi

final class ParseRecipeServise {
    
    private let host = "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
    private let apiKey = "49515c1d30mshbd64ee0fbe44bcep129b4ajsn4601ba0ff3f3"
    
    func parseRecipe(recipyURL: String, handler: @escaping (ParsedRecipe?) -> Void) {
        ParserecipeAPI.getRecipe(requestUrl: recipyURL,
                                 xRapidapiHost: host,
                                 xRapidapiKey: apiKey) { (recipe, error) in
                                    if let recipe = recipe {
                                        handler(recipe)
                                    } else if let error = error {
                                        print("Parse Recipe failed with error: \(error.localizedDescription)")
                                        print(error.localizedDescription)
                                        handler(nil)
                                    }
        }
    }
}

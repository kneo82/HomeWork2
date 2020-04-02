//
//  RecipeRequestModel.swift
//  HomeWork2
//
//  Created by Vitaliy Voronok on 16.03.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

struct RecipeRequestModel: Identifiable {
    
    let title: String
    let ingridients: String
    let query: String
    
    var id: String {
        self.title
    }
}

extension RecipeRequestModel: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.title == rhs.title && lhs.ingridients == rhs.ingridients && lhs.query == rhs.query
    }
}

struct RecipeRequestListModel {
    let items: [RecipeRequestModel] = [
        RecipeRequestModel(title: "Omelet", ingridients: "onion,garlic", query: "omelet"),
        RecipeRequestModel(title: "Soup", ingridients: "beef,garlic", query: "soup"),
        RecipeRequestModel(title: "Salad", ingridients: "avocado,cucumber", query: "salad"),
        RecipeRequestModel(title: "Beef", ingridients: "beef,mushroom", query: "beef"),
        RecipeRequestModel(title: "Chili", ingridients: "beef,chili", query: "chili"),
        RecipeRequestModel(title: "Pizza", ingridients: "beef,mushroom,chees", query: "pizza")
    ]
}


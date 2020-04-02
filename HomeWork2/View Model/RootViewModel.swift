//
//  RootViewModel.swift
//  HomeWork2
//
//  Created by Vitaliy Voronok on 16.03.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

class RootViewModel: ObservableObject {
    private var serviceLocator: ServiceLocator?
    
    @Published var requests: RecipeRequestListModel
    @Published var selectedItem: RecipeRequestModel?

    var recipeViewModel: RecipeViewModel {
        RecipeViewModel(serviceLocator: self.serviceLocator, recipeRequest: self.selectedItem!)
    }
    
    init(serviceLocator: ServiceLocator?, recipeRequestListModel: RecipeRequestListModel) {
        self.serviceLocator = serviceLocator
        self.requests = recipeRequestListModel
        self.selectedItem = recipeRequestListModel.items.first
    }
}

//
//  RootViewModel.swift
//  HomeWork2
//
//  Created by Vitaliy Voronok on 16.03.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

class RootViewModel: ObservableObject {
    @Published var requests = RecipeRequestListModel()
    @Published var selectedItem: RecipeRequestModel? = RecipeRequestModel(title: "Omelet", ingridients: "onion,garlic", query: "omelet")
}

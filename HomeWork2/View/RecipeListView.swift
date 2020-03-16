//
//  RecipeListView.swift
//  HomeWork2
//
//  Created by Vitaliy Voronok on 16.03.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

struct RecipeListView: View {
    @ObservedObject var viewModel: RecipeViewModel
    
    init(viewModel: RecipeViewModel) {
        self.viewModel = viewModel
        self.viewModel.loadPage()
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.items) { item in
                VStack(alignment: .leading) {
                    RowView(item: item)
                    .onAppear() {
                        if self.viewModel.items.isLast(item) {
                            self.viewModel.loadPage()
                        }
                    }
                }
            }
            .navigationBarTitle("Recipes")
            .onAppear() {
                self.viewModel.loadPage()
            }
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static private let model = RecipeViewModel(recipeRequest: RecipeRequestModel(title: "Omelet", ingridients: "onion,garlic", query: "omelet"))
    
    static var previews: some View {
        RecipeListView(viewModel: model)
    }
}
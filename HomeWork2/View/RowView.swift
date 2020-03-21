//
//  RowView.swift
//  HomeWork2
//
//  Created by Vitaliy Voronok on 16.03.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

struct RowView: View {
    @ObservedObject var viewModel: RecipeViewModel
    
    let item: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            NavPushButton(destination: RecipeView(recipe: item)) {
                Text(self.item.title?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
                    .font(.title)
            }
            if self.viewModel.isPageLoading && self.viewModel.items.isLast(item) {
                Divider()
                Text("Loading...")
                    .padding(.vertical)
            }
        }
    }
}

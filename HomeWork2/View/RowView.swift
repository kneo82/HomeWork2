//
//  RowView.swift
//  HomeWork2
//
//  Created by Vitaliy Voronok on 16.03.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

struct RowView: View {
    @EnvironmentObject var viewModel: RecipeViewModel
    
    let item: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title ?? "")
                .font(.headline)
            
            Text(item.ingredients ?? "")
                .font(.body)
                .foregroundColor(.gray)
            
//            if self.viewModel.isPageLoading && self.viewModel.items.isLast(item) {
//                Divider()
//                Text("Loading...")
//                    .padding(.vertical)
//            }
        }
    }
}

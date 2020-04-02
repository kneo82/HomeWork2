//
//  RowView.swift
//  HomeWork2
//
//  Created by Vitaliy Voronok on 16.03.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI
import UIComponents

struct RowView: View {
    @ObservedObject var viewModel: RowViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            UIComponents.NavPushButton(destination: RecipeView(recipe: self.viewModel.item)) {
                Text(self.viewModel.item.title?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
                    .font(.title)
            }
            if self.viewModel.isPageLoading && self.viewModel.isLast {
                Divider()
                Text("Loading...")
                    .padding(.vertical)
            }
        }
    }
}

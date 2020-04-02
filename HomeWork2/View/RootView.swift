//
//  ContentView.swift
//  HomeWork2
//
//  Created by Vitaliy Voronok on 15.03.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI
import UIComponents

struct RootView: View {
    @EnvironmentObject var viewModel: RootViewModel
    
    var body: some View {
        NavControllerView(transition: .custom(.opacity)) {
            VStack(alignment: .leading) {
                SelectRequestView()
                
                if (self.viewModel.selectedItem != nil) {
                    RecipeListView(viewModel: self.viewModel.recipeViewModel)
                } else {
                    List {
                        EmptyView()
                    }
                }
            }
        }
    }
}

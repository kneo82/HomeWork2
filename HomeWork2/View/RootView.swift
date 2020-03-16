//
//  ContentView.swift
//  HomeWork2
//
//  Created by Vitaliy Voronok on 15.03.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var viewModel: RootViewModel

    var body: some View {
        NavControllerView(transition: .custom(.scale)) {
            VStack(alignment: .leading) {
                SelectRequestView()

                if (self.viewModel.selectedItem != nil) {
                    RecipeListView(viewModel: RecipeViewModel(recipeRequest: self.viewModel.selectedItem!))
                } else {
                    List {
                        EmptyView()
                    }
                }
                
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
        .environmentObject(RootViewModel())
    }
}

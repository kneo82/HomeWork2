//
//  SelectRequestView.swift
//  HomeWork2
//
//  Created by Vitaliy Voronok on 16.03.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

struct SelectRequestView: View {
    @EnvironmentObject var viewModel: RootViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(viewModel.requests.items) { item in
                    ZStack {
                        if self.viewModel.selectedItem == item {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.green)
                        } else {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.blue)
                        }
                        VStack {
                            Text(item.title)
                                .font(.headline)
                            Text(item.ingridients)
                                .font(.caption)
                                .foregroundColor(.yellow)
                        }
                    }
                    .frame(width: 150)
                    .frame(height: 150)
                    .onTapGesture {
                        self.viewModel.selectedItem = item
                    }
                }
            }
            .padding(.horizontal, 10)
        }
        .frame(height: 190)
    }
}

struct SelectRequestView_Previews: PreviewProvider {
    static var previews: some View {
        SelectRequestView()
    }
}

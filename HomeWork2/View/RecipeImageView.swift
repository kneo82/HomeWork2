//
//  RecipeImageView.swift
//  HomeWork2
//
//  Created by Vitaliy Voronok on 19.03.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

struct RecipeImageView: View {
    let imagePath: String?
    
    var body: some View {
        VStack {
            HStack {
                NavPopButton(destination: .previous) {
                    Text("< Back")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                    
                    Spacer()
                    
                    Text("Image")
                        .font(.subheadline)
                    
                    Spacer()
                    
                    NavPopButton(destination: .root) {
                        Text("To Root View")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding(20)
            
            URLImage(imageUrl: imagePath ?? "")
            
            Spacer()
            
        }
    }
}

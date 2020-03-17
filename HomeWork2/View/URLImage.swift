//
//  URLImage.swift
//  HomeWork2
//
//  Created by Vitaliy Voronok on 16.03.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI
import Combine

struct URLImage: View {
    @ObservedObject var imageURL: RemoteImageURL
    
    init(imageUrl: String) {
        self.imageURL = RemoteImageURL(imageURL: imageUrl)
    }
    
    var body: some View {
        if imageURL.data.isEmpty {
            return Image(systemName: "photo")
                .resizable()
                .frame(width: 150.0, height: 150.0)
        } else {
            return Image(uiImage: UIImage(data: imageURL.data) ?? UIImage())
                .resizable()
                .frame(width: 150.0, height: 150.0)
        }
    }
}

class RemoteImageURL: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    
    @Published var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(imageURL: String) {
        guard let url = URL(string: imageURL) else {
            return
            
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }
            
            DispatchQueue.main.async {
                self.data = data
            }
        }
        .resume()
    }
}

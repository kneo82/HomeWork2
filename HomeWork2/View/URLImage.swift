//
//  URLImage.swift
//  HomeWork2
//
//  Created by Vitaliy Voronok on 16.03.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

//import SwiftUI
//import Combine
//
//struct URLImage: View {
//    @ObjectBinding private var imageLoader: ImageLoader
//    
//    init(url: URL, placeholder: Image = Image(systemName: "photo")) {
//        // ...
//    }
//    
//    var body: some View {
//        if let image = imageLoader.image {
//            return image
//                .onAppear {}
//                .onDisappear {}
//        }
//        else {
//            return placeholder
//                .onAppear {
//                    self.imageLoader.load()
//                }
//                .onDisappear {
//                    self.imageLoader.cancel()
//                }
//        }
//    }
//}
//
//class ImageLoader : BindableObject {
//    
//    var image: Image?
//    
//    enum LoadingState : Hashable {
//       // ...
//    }
//    
//    private(set) var state: LoadingState = .initial {
//        didSet {
//            didChange.send(self)
//        }
//    }
//    
//    let didChange = PassthroughSubject<ImageLoader, Never>()
//
//    func load() {
//        // ...
//    }
//  
//    func cancel() {
//        // ...
//    }
//}
//
//struct URLImage_Previews: PreviewProvider {
//    static var previews: some View {
//        URLImage()
//    }
//}

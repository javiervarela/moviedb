//
//  MovieRowView.swift
//  MovieDB
//
//  Created by Javier Angel Varela Cebey on 13/06/2019.
//  Copyright © 2019 Javier Angel Varela Cebey. All rights reserved.
//

import SwiftUI
import Combine

struct MovieRowView: View {
    let movie: Movie
    
    var body: some View {
        HStack {
            ImageViewWidget(url: "https://image.tmdb.org/t/p/w185" + movie.poster_path)
            VStack (alignment: .leading) {
                Text(movie.title).font(.title)
                Text(movie.overview).font(.subheadline).lineLimit(4)
            }
        }
    }
}

class ImageLoader: BindableObject {
    var didChange = PassthroughSubject<Data, Never>()
    
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(url: String) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.data = data
            }
            }.resume()
    }
}

struct ImageViewWidget: View {
    @ObjectBinding var imageLoader: ImageLoader
    
    init(url: String) {
        imageLoader = ImageLoader(url: url)
    }
    
    var body: some View {
        Image(uiImage: (imageLoader.data.count == 0) ? UIImage(named: "descarga")! : UIImage(data: imageLoader.data)!)
            .resizable()
            .frame(width: 92, height: 138)
    }
}

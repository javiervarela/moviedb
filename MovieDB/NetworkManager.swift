//
//  File.swift
//  MovieDB
//
//  Created by Javier Angel Varela Cebey on 13/06/2019.
//  Copyright © 2019 Javier Angel Varela Cebey. All rights reserved.
//

import SwiftUI
import Combine

class NetworkManager: BindableObject {
    var didChange = PassthroughSubject<NetworkManager, Never>()
    
    var movies = [Movie]() {
        didSet {
            didChange.send(self)
        }
    }
    
    init() {
        let json = "https://api.themoviedb.org/3/movie/now_playing?api_key=28849cda5d05d4dafd12c6c2126f54bc&language=es-ES&page=1"
        guard let url = URL(string: json) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            let movieRequest = try! JSONDecoder().decode(MovieRequest.self, from: data)
            
            DispatchQueue.main.async {
                self.movies = movieRequest.results
            }
        }.resume()
    }
}

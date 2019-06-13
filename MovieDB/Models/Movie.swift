//
//  Movie.swift
//  MovieDB
//
//  Created by Javier Angel Varela Cebey on 13/06/2019.
//  Copyright © 2019 Javier Angel Varela Cebey. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    let id: Int
    let title, poster_path, overview: String
}

struct MovieRequest: Decodable {
    let results: [Movie]
}

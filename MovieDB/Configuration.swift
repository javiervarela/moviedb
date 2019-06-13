//
//  Configuration.swift
//  MovieDB
//
//  Created by Javier Angel Varela Cebey on 13/06/2019.
//  Copyright © 2019 Javier Angel Varela Cebey. All rights reserved.
//

import Foundation

struct Configuration {
    static let API_KEY = "28849cda5d05d4dafd12c6c2126f54bc"
    static let API_BASE = "https://api.themoviedb.org/3/"
    
    static let API_MOVIES = API_BASE + "movie/now_playing?api_key=" + API_KEY + "language=es-ES&page=1"
}

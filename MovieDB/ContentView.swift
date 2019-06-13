//
//  ContentView.swift
//  MovieDB
//
//  Created by Javier Angel Varela Cebey on 13/06/2019.
//  Copyright © 2019 Javier Angel Varela Cebey. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var apiUrl = Configuration.API_MOVIES
    
    @State var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.movies.identified(by: \.id)) { movie in
                MovieRowView(movie: movie)
            }.navigationBarTitle(Text("Now playing"))
        }
    }
}

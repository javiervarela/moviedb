//
//  File.swift
//  MovieDB
//
//  Created by Javier Angel Varela Cebey on 13/06/2019.
//  Copyright © 2019 Javier Angel Varela Cebey. All rights reserved.
//

import Foundation

class Logger {
    static func log(text: Any) {
        #if DEBUG
        print(text)
        #endif
    }
}

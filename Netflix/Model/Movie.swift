//
//  Movie.swift
//  Netflix
//
//  Created by Zeki Baklan on 1.12.2023.
//

import Foundation

struct Movie : Identifiable {
    
    var id : String
    var name :  String
    var thumbnailURL : URL
    
    var categories : [String]
    
    
}

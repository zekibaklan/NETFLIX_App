//
//  Trailer.swift
//  Netflix
//
//  Created by Zeki Baklan on 2.12.2023.
//

import Foundation

struct Trailer : Identifiable ,Hashable {
    
    var id : String = UUID().uuidString
    
    var name :  String
    
    var videoURL : URL
    
    var thumbnailImageURL : URL
    
}

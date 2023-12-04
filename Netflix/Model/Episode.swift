//
//  Episode.swift
//  Netflix
//
//  Created by Zeki Baklan on 1.12.2023.
//

import Foundation

struct Episode : Identifiable
{
    
    var id = UUID().uuidString
    
    var name : String
    var season : Int
    var episodeNumber : Int
    var thumbnailImageURLString : String
    var description : String
    var length : Int
    
    var videoURL : URL
    
    var thumbnailUrl : URL {
        return URL(string: thumbnailImageURLString)!
    }
    
}

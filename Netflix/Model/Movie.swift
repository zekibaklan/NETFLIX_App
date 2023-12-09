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
    var genre : HomeGenre = .AllGenres
    
    //    MARK: - MovieDetail View
    
    var year : Int
    var rating : String
    var numberOfSeasons : Int?
    
    
    
    // Personalization
    var currentEpisode :  CurrentEpisodeInfo?
    var defaultEpisodeInfo : CurrentEpisodeInfo
    

    var creators : String
    var cast :  String
    
    
    var moreLikeThisMovies : [Movie]
    
    
    
    var episodes : [Episode]?
    
    var movieType : MovieType {
        return episodes == nil ? .movie : .tvShow
    }
    
    
    var promotionHeadline : String?
    
    var trailers : [Trailer]
    
    var numberOfSeasonsDisplay : String {
        
        if let num = numberOfSeasons {
            
            if num == 1{
                return "1 Seasons"
            }
            else
            {
                return "\(num) Seasons"
            }
        }
        return ""
    }
    
    var episodeInfoDisplay : String {
        if let current = currentEpisode {
            return "S\(current.season):B\(current.episode) \(current.episodeName)"
        }
        else
        {
            return "S\(defaultEpisodeInfo.season):B\(defaultEpisodeInfo.episode) \(defaultEpisodeInfo.episodeName)"
        }
    }
    
    var episodeDescriptionDisplay : String {
        if let current = currentEpisode {
            return current.description
        }
        else {
            return defaultEpisodeInfo.description
        }
    }
    
    
    
}

struct CurrentEpisodeInfo : Hashable,Equatable {
    var episodeName : String
    var description :  String
    var season :  Int
    var episode : Int
}

enum MovieType {
    case movie
    case tvShow
}

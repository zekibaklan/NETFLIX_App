//
//  HomeVM.swift
//  Netflix
//
//  Created by Zeki Baklan on 1.12.2023.
//

import Foundation

class HomeVM:  ObservableObject {
    
    // String = Category
    @Published var movies :[String: [Movie]] = [ : ]
    
    
    public var allCategories : [String] {
         movies.keys.map({String($0)})
    }
    
    public var  allGenre : [HomeGenre] = [.AllGenres, .Action ,.Comedy ,.Horror,.Thriller]
    
    public func getMovie(forCat cat : String,andHomeRow homeRow : HomeTopRow,andGenre genre : HomeGenre) -> [Movie] {
       
        switch homeRow {
        case .home:
            return movies[cat] ?? []
        case .movies:
            return (movies[cat] ?? []).filter({ ($0.movieType == .movie) && ($0.genre == genre) })
        case .tvShows:
            return (movies[cat] ?? []).filter({ ($0.movieType == .tvShow) && ($0.genre == genre) })
        case .myList:
            return movies[cat] ?? []
        }
        
        
    }
   
    
    init() {
        
        setupMovies()
    }
    
    func setupMovies() {
        movies["Treding Now"] = exampleMovies
        movies["Stand-Up Comedy"] = exampleMovies.shuffled()
        movies["New Releases"] = exampleMovies.shuffled()
        movies["Watch It Again"] = exampleMovies.shuffled()
        movies["Sci"] = exampleMovies.shuffled()

        
        
    }
    
    
}

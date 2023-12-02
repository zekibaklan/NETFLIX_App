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
    
    public func getMovie(forCat cat : String) -> [Movie] {
        return movies[cat] ?? []
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

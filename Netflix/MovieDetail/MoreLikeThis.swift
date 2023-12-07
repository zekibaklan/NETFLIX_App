//
//  MoreLikeThis.swift
//  Netflix
//
//  Created by Zeki Baklan on 2.12.2023.
//

import SwiftUI

struct MoreLikeThis: View {
    
    var movies : [Movie]
    
    let colomuns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
     
            LazyVGrid(columns: colomuns,  content: {
                ForEach(0..<movies.count) { index in
                    StandartHomeMovie(movie: movies[index])
                }
            })
        
        
        
    }
}

#Preview {
    MoreLikeThis(movies: exampleMovies)
}

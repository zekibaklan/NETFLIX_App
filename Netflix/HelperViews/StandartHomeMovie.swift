//
//  StandartHomeMovie.swift
//  Netflix
//
//  Created by Zeki Baklan on 1.12.2023.
//

import SwiftUI
import Kingfisher

struct StandartHomeMovie: View {
    var movie : Movie
    
    
    var body: some View {
        KFImage(movie.thumbnailURL)
            .resizable()
            .scaledToFill()
    }
}

#Preview {
    StandartHomeMovie(movie: exampleMovie1)
        .frame(width: 200,height: 200)
}

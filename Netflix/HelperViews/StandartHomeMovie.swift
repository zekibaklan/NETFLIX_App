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
        GeometryReader { proxy in
            KFImage(movie.thumbnailURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: proxy.size.width, height: proxy.size.height)
                .clipped()
        }
    }
}

#Preview {
    StandartHomeMovie(movie: exampleMovie1)
        .frame(width: 100,height: 400)
}

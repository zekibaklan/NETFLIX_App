//
//  PopularMovieView.swift
//  Netflix
//
//  Created by Zeki Baklan on 16.12.2023.
//

import SwiftUI
import Kingfisher

struct PopularMovieView: View {
    var movie : Movie
    @Binding var movieDetailToShow : Movie?
    
    var body: some View {
        GeometryReader   { proxy in
            HStack {
                KFImage(movie.thumbnailURL)
                    .resizable()
                    .frame(width: proxy.size.width / 3)
                    .padding(.leading,3)
                Text(movie.name)
                
                Spacer()
                
                Button(action: {
                    // play movie
                }, label: {
                    Image(systemName: "arrowtriangle.right.fill")
                })
                .padding(.trailing,20)
            }
            .foregroundColor(.white)
            .onTapGesture {
                self.movieDetailToShow = movie
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        PopularMovieView(movie: exampleMovie1, movieDetailToShow: .constant(nil))
            .frame(height: 75)
            .padding(.horizontal,50)
    }
}

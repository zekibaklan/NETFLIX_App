//
//  MoviePreviewCell.swift
//  Netflix
//
//  Created by Zeki Baklan on 30.12.2023.
//

import SwiftUI
import Kingfisher

struct MoviePreviewCell: View {

    var movie : Movie
    let colors : [Color] = [.yellow,.gray,.pink,.red,.blue,.green,.pink,.orange]
    
    
    var body: some View {
        ZStack(alignment : .bottom) {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(
                Circle()
                    .stroke(lineWidth: 3.0)
                    .foregroundColor(colors.randomElement())
            )
            Image(movie.previewImageName)
                .resizable()
                .scaledToFit()
                .offset(y: -20)
                .frame(height: 65)
        }
        .frame(height: 100)
    }
}

#Preview {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        MoviePreviewCell(movie: exampleMovie1)
            .frame(width: 165,height: 50)
    }
}

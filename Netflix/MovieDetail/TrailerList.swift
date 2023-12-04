//
//  TrailerList.swift
//  Netflix
//
//  Created by Zeki Baklan on 2.12.2023.
//

import SwiftUI

struct TrailerList: View {
    
    var trailers : [Trailer]
    let screen = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            ForEach(trailers) { trailer in
                VStack(alignment : .leading) {
                    VideoPreviewImage(imageURL: trailer.thumbnailImageURL, videoURL: trailer.videoURL)
                        .frame(maxWidth: screen.width)
                    Text(trailer.name)
                        .font(.headline)
                        
                }
                
                .foregroundColor(.white)
                .padding(.bottom,10)
                
                
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        TrailerList(trailers: exampleTrailers)
    }
}

//
//  VideoPreviewImage.swift
//  Netflix
//
//  Created by Zeki Baklan on 2.12.2023.
//

import SwiftUI
import Kingfisher

struct VideoPreviewImage: View {
    
    var imageURL : URL
    var videoURL : URL

@State private var showingVideoPlayer = false



    var body: some View {
        ZStack {
            KFImage(imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                
            Button(action: {
                showingVideoPlayer = true
            }, label: {

                Image(systemName: "play.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
            })
            .sheet(isPresented: $showingVideoPlayer, content: {
                SwiftUIVideoView(url: videoURL)
            })
                
        }
    }
}

#Preview {
    VideoPreviewImage(imageURL: exampleImageURL, videoURL: exampleVideoURL)
}

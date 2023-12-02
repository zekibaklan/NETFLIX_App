//
//  SwiftUIVideoView.swift
//  Netflix
//
//  Created by Zeki Baklan on 2.12.2023.
//

import SwiftUI
import AVKit

struct SwiftUIVideoView: View {
    
    var url : URL 
    private var player : AVPlayer {
        AVPlayer(url: url)
    }
    
    var body: some View {
        VideoPlayer(player: player)
    }
}

#Preview {
    SwiftUIVideoView(url: exampleVideoURL)
}

//
//  EpisodesView.swift
//  Netflix
//
//  Created by Zeki Baklan on 2.12.2023.
//

import SwiftUI

struct EpisodesView: View {
    var episodes : [Episode]
    
    @Binding var showSeasonPicker : Bool
    @Binding var selectedSeason : Int
    
   
    
    func getEpisodes(forSeason season: Int) -> [Episode]  {
        
        return episodes.filter({ $0.season == season    })
    }
    
    
    var body: some View {
        VStack(spacing : 14) {
            // Season Picker
            HStack {
                Button(action: {
                    showSeasonPicker = true
                }, label: {
                    Group {
                        Text("Season \(selectedSeason)")
                        Image(systemName: "chevron.down")
                    }
                    .font(.system(size: 16))
                })
                Spacer()
            }
            
            ForEach(getEpisodes(forSeason: selectedSeason)) { episode in
                VStack(alignment: .leading) {
                    // Hstack with preview image
                    HStack {
                        VideoPreviewImage(imageURL: episode.thumbnailUrl, videoURL: episode.thumbnailUrl)
                            .frame(width: 120,height: 70)
                            .clipped()
                        VStack(alignment : .leading) {
                            Text("\(episode.episodeNumber).\(episode.name)")
                                .font(.system(size: 16))
                            Text("\(episode.length)m")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                      
                        Image(systemName: "arrow.down.to.line.alt")
                            .font(.system(size: 20))
                    }
                    
                    // description
                    Text(episode.description)
                        .font(.system(size: 13))
                        .lineLimit(3)
                }
                .padding(.bottom,20)
            }
            Spacer()
        }
        .foregroundColor(.white)
        .padding(.horizontal,20)
        
    }
}

#Preview {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        EpisodesView(episodes: [episode1,episode2,episode3], showSeasonPicker: .constant(false), selectedSeason: .constant(1))
    }
}

//
//  CustomTabSwitcher.swift
//  Netflix
//
//  Created by Zeki Baklan on 2.12.2023.
//

import SwiftUI

struct CustomTabSwitcher: View {
    
    
    @State private var currentTab : CustomTab = .episodes
    
    var tabs : [CustomTab]
    var movie : Movie
  
    
    @Binding var showSeasonPicker : Bool
    @Binding var selectedSeason : Int
    
    func widthForTab(_ tab : CustomTab) -> CGFloat
    {
        let string = tab.rawValue
        return string.widthOfString(usingFont: .systemFont(ofSize: 16,weight: .bold))
    }
    
    var body: some View {
        
        VStack {
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing : 20) {
                    ForEach(tabs,id: \.self) { tab in
                        
                        VStack {
                            // Red Bar
                            Rectangle()
                                .frame(width: widthForTab(tab),height: 6)
                                .foregroundColor(tab == currentTab ? .red : .clear)
                            
                            // Button
                            Button(action: {
                                currentTab = tab
                            }, label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16,weight: .bold))
                                    .foregroundColor(tab == currentTab ? .white : .gray)
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: widthForTab(tab),height: 30)
                          
                        }
                        
                    }
                }
            }
            // SELECTED VIEW
            switch currentTab {
            case .episodes:
                EpisodesView(episodes: movie.episodes ?? [], showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason)
                
            case .trailers:
                TrailerList(trailers: movie.trailers)
            case .more:
                MoreLikeThis(movies: movie.moreLikeThisMovies)
            }
        }
        .foregroundColor(.white)
    }
}
enum CustomTab : String {
    
    case episodes = "EPISODES"
    case trailers = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
}

#Preview {

    
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        CustomTabSwitcher(tabs: [.episodes, .trailers, .more], movie: exampleMovie1,showSeasonPicker: .constant(false),selectedSeason: .constant(1))
    }
}

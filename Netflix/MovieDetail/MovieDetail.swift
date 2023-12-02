//
//  MovieDetail.swift
//  Netflix
//
//  Created by Zeki Baklan on 1.12.2023.
//

import SwiftUI

struct MovieDetail: View {
    var movie : Movie
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        //
                    }, label: {
                       Image(systemName: "xmark.circle")
                            .font(.system(size: 28))
                    })
                    
                }
                .padding(.horizontal,22)
                
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack {
                        StandartHomeMovie(movie: movie)
                            .frame(width: screen.width/2.5)
                          
                        
                        MovieInfoSubHeadline(movie: movie)
                        
                        if movie.promotionHeadline != nil {
                            Text(movie.promotionHeadline!)
                                .bold()
                                .font(.headline)
                        }
                        
                        PlayButton(text: "Play", imageName: "play.fill", backgroundColor: .red) {
                            //
                        }
                  
                        CurrentEpisodeInformation(movie: movie)
                        CastInfo(movie: movie)
                    
                        HStack(spacing : 60) {
                            SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                                //
                            }
                            SmallVerticalButton(text: "Rate", isOnImage: "hand.thumbsup.fill", isOffImage: "hand.thumbsup", isOn: false) {
                                //
                            }
                            SmallVerticalButton(text: "Share", isOnImage: "square.and.arrow.up", isOffImage: "square.and.arrow.up", isOn: true) {
                                //
                            }
                            Spacer()
                        }
                        .padding(.leading,20)
                        
//                        
//                        CustomTabSwitcher(tabs: <#[CustomTab]#>)
                        
                    }
                    .padding(.horizontal,10)
                }
                
                Spacer()
            }
            .foregroundColor(.white)
            
            
            
            
        }
        
    }
}


#Preview {
    MovieDetail(movie: exampleMovie2)
}






struct MovieInfoSubHeadline: View {
    var movie : Movie
    var body: some View {
        HStack(spacing : 20) {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            Text(String(movie.year))
            
            RatingView(rating: movie.rating)
            
            if movie.numberOfSeasons != nil {
                Text(movie.numberOfSeasonsDisplay)
            }
         
        }
        .foregroundColor(.gray)
        .padding(.vertical,6)
    }
}

struct RatingView: View {
    var rating : String
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            Text(rating)
                .foregroundStyle(.white)
                .font(.system(size: 12))
                .bold()
        }
        .frame(width: 50,height: 20)
 
    }
}

struct CastInfo: View {
    var movie : Movie
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                Text("Cast: \(movie.cast)")
                Spacer()
            }
            HStack {
                Text("Creators: \(movie.creators)")
                Spacer()
            }
        }
        .font(.caption)
        .foregroundColor(.gray)
        .padding(.vertical,10)
    }
}

struct CurrentEpisodeInformation: View {
    var movie : Movie
    var body: some View {
        Group {
            HStack {
                Text(movie.episodeInfoDisplay)
                    .bold()
                Spacer()
            }
            .padding(.vertical,4)
            
            HStack {
                Text(movie.episodeDescriptionDisplay)
                    .font(.subheadline  )
                Spacer()
            }
        }
    }
}

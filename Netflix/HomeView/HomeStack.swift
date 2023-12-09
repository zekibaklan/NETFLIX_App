//
//  HomeStack.swift
//  Netflix
//
//  Created by Zeki Baklan on 7.12.2023.
//

import Foundation
import SwiftUI

struct HomeStack: View {
    
    var vm : HomeVM
    var topRowSelection : HomeTopRow
    var selectedGenre : HomeGenre
    
    @Binding var movieDetailToShow : Movie?
    
    
    
    var body: some View {
        ForEach(vm.allCategories,id: \.self) {    category in
            VStack {
                HStack {
                    Text(category)
                        .font(.title3)
                        .bold()
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(vm.getMovie(forCat: category, andHomeRow: topRowSelection, andGenre: selectedGenre)) { movie in
                            StandartHomeMovie(movie: movie)
                                .frame(width: 100,height: 200)
                                .padding(.horizontal,20)
                                .onTapGesture {
                                    movieDetailToShow = movie
                                    print("basıldı")
                                }
                            
                        }
                    }
                }
            }
            
        }
    }
}
#Preview {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        ScrollView {
            HomeStack(vm: HomeVM(), topRowSelection: .home, selectedGenre: .AllGenres, movieDetailToShow: .constant(nil))
        }
        .foregroundColor(.white)
  
    }
}

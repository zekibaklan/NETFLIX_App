//
//  HomeView.swift
//  Netflix
//
//  Created by Zeki Baklan on 1.12.2023.
//

import SwiftUI

struct HomeView: View {
    
    var vm = HomeVM()
    
    let screen = UIScreen.main.bounds
    
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators : false) {
                LazyVStack {
                    
                    TopRowButtons()
                    
                TopMoviePreview(movie: exampleMovie5)
                .frame(width: screen.width)
                .padding(.top,-120)
                .zIndex(-1)
                   
                    
                    
                    ForEach(vm.allCategories,id: \.self) {    category in
                        VStack {
                            HStack {
                                Text(category)
                                    .font(.title3)
                                    .bold()
                                Spacer()
                            }
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(vm.getMovie(forCat: category)) { movie in
                                        StandartHomeMovie(movie: movie)
                                            .frame(width: 100,height: 200)
                                            .padding(.horizontal,20)
                                    }
                                }
                            }
                        }
                           
                    }
                }
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    HomeView()
}

struct TopRowButtons: View {
    var body: some View {
        HStack {
            
            Button(action: {
                //
            }, label: {
                Image("netflix_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
            })
            .buttonStyle(.plain)
            Spacer()
            
            
            Button(action: {
                //
            }, label: {
                Text("TV Shows")
            })
            .buttonStyle(.plain)
            Spacer()
            
            
            Button(action: {
                //
            }, label: {
                Text("Movies")
            })
            .buttonStyle(.plain)
            Spacer()
            
            
            Button(action: {
                //
            }, label: {
                Text("My List")
            })
            .buttonStyle(.plain)
            
            
            
        }
        .padding(.leading,20)
        .padding(.trailing,30)
        
    }
}

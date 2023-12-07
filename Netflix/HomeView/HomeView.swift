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
    
    @State private var movieDetailToShow : Movie? = nil
    @State private var topRowSelection : HomeTopRow = .home
    @State private var homeGenre : HomeGenre = .AllGenres
    @State private var showGenreSelection = false
    @State private var showTopRowSelection = false
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators : false) {
                LazyVStack {
                    
                    TopRowButtons(topRowSelection: $topRowSelection, homeGenre: $homeGenre,showGenreSelection: $showGenreSelection,showTopRowSelection : $showTopRowSelection)
                    
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
                                LazyHStack {
                                    ForEach(vm.getMovie(forCat: category)) { movie in
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
            if movieDetailToShow != nil {
                MovieDetail(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeInOut)
                    .transition(.opacity)
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    HomeView()
}

struct TopRowButtons: View {
    
    @Binding var topRowSelection : HomeTopRow
    @Binding var homeGenre : HomeGenre
    @Binding var showGenreSelection : Bool
    @Binding var showTopRowSelection : Bool
    
    var body: some View {
        switch topRowSelection {
        case .home:
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
                    topRowSelection = .tvShows
                }, label: {
                    Text("TV Shows")
                })
                .buttonStyle(.plain)
                Spacer()
                
                
                Button(action: {
                    topRowSelection = .movies
                }, label: {
                    Text("Movies")
                })
                .buttonStyle(.plain)
                Spacer()
                
                
                Button(action: {
                    topRowSelection = .myList
                }, label: {
                    Text("My List")
                })
                .buttonStyle(.plain)
                
                
                
            }
            .padding(.leading,20)
            .padding(.trailing,30)
        case .tvShows,.movies,.myList:
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
                
                
                
                HStack(spacing : 20) {
                    Button(action: {
                    showTopRowSelection = true
                    }, label: {
                        HStack {
                            Text(topRowSelection.rawValue)
                                .font(.system(size: 18))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 10))
                                .rotationEffect(.degrees(180),anchor: .center)
                        }
                    })
                    .buttonStyle(.plain)
                    
                    
                    
                    
                    Button(action: {
                        showGenreSelection = true
                    }, label: {
                        HStack {
                            Text(homeGenre.rawValue)
                                .font(.system(size: 12))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 6))
                                .rotationEffect(.degrees(180),anchor: .center)
                        }
                    })
                    .buttonStyle(.plain)
                    Spacer()
                    
                }
                
                
                
                
            }
            .padding(.leading,20)
            .padding(.trailing,30)
        }
        
        
        
        
        
        
        
    }
}
enum HomeTopRow : String , CaseIterable {
    
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
    
}

enum HomeGenre : String{
    case AllGenres
    case Action
    case Comdey
    case Horror
    case Thriller
}


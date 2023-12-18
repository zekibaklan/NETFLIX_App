//
//  ContentView.swift
//  Netflix
//
//  Created by Zeki Baklan on 1.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    
    var body: some View {
        
        
        
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                        .tag(0)
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                        .tag(1)
                }
            Text("Coming Soon")
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("1")
                        .tag(2)
                }
            Text("Downloads")
                .tabItem {
                    Image(systemName: "arrow.down.to.line.alt")
                    Text("1")
                        .tag(3)
                }
            Text("More")
                .tabItem {
                    Image(systemName: "equal")
                    Text("1")
                        .tag(4)
                }
        }
        .tint(.white)
        
    }
}

#Preview {
    ContentView()
}

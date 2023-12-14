//
//  SearchView.swift
//  Netflix
//
//  Created by Zeki Baklan on 13.12.2023.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var vm = SearchModel()
    
    @State private var searchText = ""
    
    var body: some View {
        let searchTextBinding = Binding {
            return searchText
        } set: {
            searchText = $0
            vm.updateSearchText(with: $0)
        }
        
        return ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBar(text: searchTextBinding, isLoading: $vm.isLoading)
                    .padding()
                ScrollView {
                    if vm.isShowingPopularMovies {
                        Text("Popular Movies")
                    }
                    
                    if vm.viewState == .empty {
                        Text("Empty")
                    }
                    else if vm.viewState == .ready && !vm.isShowingPopularMovies
                    {
                        Text("Search Results")
                    }
                }
                
                Spacer()
            }
        }
        .foregroundColor(.white)
    }
}

#Preview {
    SearchView()
}

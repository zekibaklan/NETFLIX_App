//
//  SearchBar.swift
//  Netflix
//
//  Created by Zeki Baklan on 10.12.2023.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text : String
    @State private var isEditing = true
    @Binding var isLoading : Bool
    var body: some View {
        
        ZStack(alignment : .leading) {
            Color.graySearchBackground_
                .frame(width: 270,height: 36)
                .cornerRadius(8)
            HStack {
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.graySearchText_)
                    .padding(.leading)
                
                                
                TextField("Search", text: $text)
                    .padding(7)
                    .padding(.trailing,-7)
                    .background(Color.graySearchBackground_)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .onTapGesture {
                        isEditing = true
                    }
                    .animation(.default)
                
                if !text.isEmpty {
                    if isLoading {
                        Button(action: {
                            text = ""
                        }, label: {
                            ActivityIndicator(style: .medium, animate: .constant(true))
                                .configure{
                                    $0.color = .white
                                }
                            
                        })
                        .padding(.trailing,32)
                        .frame(width: 35,height: 35)
                    }else
                    {
                        
                            Button(action: {
                                text = ""
                            }, label: {
                                
                              Image(systemName: "xmark.circle.fill")
                                  .foregroundStyle(Color.graySearchText_)
                                  .frame(width: 35,height: 35)
                            })
                            .padding(.trailing,18)
                    }
                }
                
               
                
               
                if isEditing {
                    
                    Button(action: {
                       text = ""
                        isEditing = false
                        hideKeyboard()
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(.white)
                    
                    })
                    .padding(.trailing,10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                    
                }
                
                
             
                
            }
        }
      
    }
}

#Preview {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        SearchBar(text: .constant(""), isLoading: .constant(false))
            .padding()
    }
}

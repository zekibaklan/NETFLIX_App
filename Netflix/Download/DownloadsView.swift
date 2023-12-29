//
//  DownloadsView.swift
//  Netflix
//
//  Created by Zeki Baklan on 29.12.2023.
//

import SwiftUI

struct DownloadsView: View {
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "info.circle")
                Text("Smart Downloads")
                Text("ON")
                    .foregroundStyle(.blue)
                Spacer()
            }
            .padding()
            .font(.system(size: 18,weight: .bold))
            
            
            ZStack {
                Circle()
                    .foregroundColor(.graySearchBackground)
                    .padding(.horizontal, 100)
                
                Image(systemName: "arrow.down.to.line.alt")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 75)
                    .foregroundColor(.gray)
            }
            .frame(height: 275)
            .padding(.top,75)
            
            
            VStack(spacing : 20) {
                
                Text("Never be without Netflix")
                    .font(.title2)
                    .bold()
                Text("Download shows and movies so you'll never be without something to watch \n-- even when you're offline")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,50)
                
                Button(action: {
                    // Shows
                }, label: {
                    Text("See What You Can Download")
                        .foregroundStyle(.black)
                        .padding()
                        .background()
                })
                
                
            }

            Spacer()
        }
     
        .foregroundColor(.white)
    }

    
}

#Preview {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        DownloadsView()
    }
}

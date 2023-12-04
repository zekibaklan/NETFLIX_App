//
//  WhiteButton.swift
//  Netflix
//
//  Created by Zeki Baklan on 1.12.2023.
//

import SwiftUI

struct PlayButton: View {
    
    
    var text :  String
    var imageName : String
    var backgroundColor : Color = Color.white
    
    var action:  () -> Void
    
    var body: some View {
        
        Button(action: {
            
        }, label: {
            HStack {
                Spacer()
                Image(systemName: imageName)
                    .font(.headline)
                Text(text)
                    .bold().font(.system(size: 16))
                Spacer()
            }
            .padding(.vertical,6)
            .background(backgroundColor)
            .foregroundColor(backgroundColor == .white ? .black : .white)
            .cornerRadius(3.0)
        })
    }
}

#Preview {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        PlayButton(text: "Play", imageName: "play.fill") {
            
        }
    }
}

//
//  SmallVerticalButton.swift
//  Netflix
//
//  Created by Zeki Baklan on 1.12.2023.
//

import SwiftUI

struct SmallVerticalButton: View {
    
    var text : String
    
    var isOnImage : String
    var isOffImage :  String
    
    var isOn :  Bool
   
    var imageName : String {
        if isOn {
            return isOnImage
        }
        else
        {
            return isOffImage
        }
        
    }
    
    var action : () -> Void
    
    var body: some View {
        Button(action: {
           
           
        }, label: {
            VStack {
                Image(systemName: imageName)
                    .foregroundColor(.white)
                Text(text)
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                    .bold()
            }
        })
    }
}

#Preview {
    ZStack {
        Color.black
        SmallVerticalButton(
            text: "My List",
            isOnImage: "checkmark",
            isOffImage: "plus",
            isOn: false) {
            print("Tapped")
        }
    }
}

//
//  NotificationBar.swift
//  Netflix
//
//  Created by Zeki Baklan on 19.12.2023.
//

import SwiftUI

struct NotificationBar: View {
    
    @Binding var showNotificationList : Bool
    
    var body: some View {
        Button(action: {
            showNotificationList = true
        }, label: {
            HStack {
                Image(systemName: "bell")
                Text("Notifications")
                    .bold()
                Spacer()
                Image(systemName: "chevron.right")
            }
            .font(.system(size: 18,weight: .bold))
        })
        .foregroundColor(.white)
        .padding()
    }
}

#Preview {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        NotificationBar(showNotificationList: .constant(false))
    }
}

//
//  ComingSoon.swift
//  Netflix
//
//  Created by Zeki Baklan on 19.12.2023.
//

import SwiftUI

struct ComingSoon: View {
    @State private var showNotificationList = false
    @State private var navBarHidden = true
    var body: some View {
        NavigationView   {
            Group {
                ZStack {
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    
                    ScrollView {
                        VStack {
                           NotificationBar(showNotificationList: $showNotificationList)
                            
                            Text("For each loop of cells")
                        }
                        
                    }
                    .foregroundColor(.white)
                }
                NavigationLink(
                    destination: Text("Notification List"),
                    isActive: $showNotificationList,
                    label: {
                        EmptyView()
                    })
                .navigationTitle("zeki")
                .navigationBarHidden(navBarHidden)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                    self.navBarHidden = false
                })
            }
        }
    }
}

#Preview {
    ComingSoon()
}

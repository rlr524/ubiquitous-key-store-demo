//
//  TabViewStart.swift
//  UbiquitousKeyStoreDemo
//
//  Created by Rob Ranf on 8/12/22.
//

import SwiftUI

struct TabViewStart: View {
    // Listener for notification when data is changed so load button doesn't need to be pressed
    let pub = NotificationCenter.default.publisher(
        for: NSUbiquitousKeyValueStore.didChangeExternallyNotification,
        object: nil)
        .receive(on: RunLoop.main)
    @State private var receiveNotification = false

    var body: some View {
        NavigationView {
            TabView {
                SimpleObject(receiveNotification: $receiveNotification)
                    .tabItem {
                        Label("Simple Object", systemImage: "1.circle.fill")
                    }
                CodableObject(receiveNotification: $receiveNotification)
                    .tabItem {
                        Label("Codable Object", systemImage: "2.circle.fill")
                    }
            }
        }
        .onReceive(pub, perform: { pub in
            if pub.name == NSUbiquitousKeyValueStore.didChangeExternallyNotification {
                receiveNotification = true
            }
        })
        .navigationViewStyle(.stack)
    }
}

struct TabViewStart_Previews: PreviewProvider {
    static var previews: some View {
        TabViewStart()
    }
}

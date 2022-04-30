//
//  VietDripApp.swift
//  VietDrip WatchKit Extension
//
//  Created by Clarence on 26/04/22.
//

import SwiftUI

@main
struct VietDripApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            CustomizeCupView()
                .environmentObject(AppState())
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}

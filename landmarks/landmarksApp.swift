//
//  landmarksApp.swift
//  landmarks
//
//  Created by Alejandro Sanabria on 20/02/23.
//

import SwiftUI

@main
struct landmarksApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(LandmarkViewModel())
        }
    }
}

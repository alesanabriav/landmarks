//
//  MainView.swift
//  landmarks
//
//  Created by Alejandro Sanabria on 20/02/23.
//

import SwiftUI

struct MainView: View {
   
    var body: some View {
        TabView {
            FeaturedView()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
            
            LandmarkListView()
                .tabItem {
                    Label("List", systemImage: "list.dash")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(LandmarkViewModel())
    }
}

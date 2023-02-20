//
//  LandmarkListView.swift
//  landmarks
//
//  Created by Alejandro Sanabria on 20/02/23.
//

import SwiftUI

struct LandmarkListView: View {
    @EnvironmentObject var viewModel: LandmarkViewModel
    
    var body: some View {
        NavigationView {
            List {
                Toggle("Favorites only", isOn: $viewModel.showFavoritesOnly)
                
                ForEach(viewModel.filtered) { landmark in
                    NavigationLink {
                        LandmarkDetailView(landmark: landmark)
                    } label: {
                        LandmarkRowView(landmark: landmark)
                    }
                }

            }
            .listStyle(.plain)
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView()
            .environmentObject(LandmarkViewModel())
    }
}

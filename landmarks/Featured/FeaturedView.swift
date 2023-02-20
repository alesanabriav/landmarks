//
//  FeaturedView.swift
//  landmarks
//
//  Created by Alejandro Sanabria on 20/02/23.
//

import SwiftUI

struct FeaturedView: View {
    @EnvironmentObject var viewModel: LandmarkViewModel
    
    var body: some View {
        NavigationView {
            List {
                viewModel.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(viewModel.categories.keys.sorted(), id: \.self) { key in
                    CategoryRowView(categoryName: key, items: viewModel.categories[key] ?? [])
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.plain)
            .navigationTitle("Featured")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
            .environmentObject(LandmarkViewModel())
    }
}

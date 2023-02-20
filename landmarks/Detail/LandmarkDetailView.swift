//
//  LandmarkDetailView.swift
//  landmarks
//
//  Created by Alejandro Sanabria on 20/02/23.
//

import SwiftUI

struct LandmarkDetailView: View {
    @EnvironmentObject var viewModel: LandmarkViewModel
    var landmark: Landmark
    var index: Int {
        viewModel.landmarks.firstIndex { $0.id == landmark.id } ?? 0
    }
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
            
            CircleImageView(imageName: landmark.imageName)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)
                .frame(width: 140)
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    
                    FavoriteButtonView(value: $viewModel.landmarks[index].isFavorite)
                }
               
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Divider()
                
                ScrollView(showsIndicators: false) {
                    Text(landmark.description)
                }
                
            }
            .padding()
            
            Spacer()
        }
    }
}

struct LandmarkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetailView(landmark: LandmarkViewModel().landmarks[0])
            .environmentObject(LandmarkViewModel())
    }
}

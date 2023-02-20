//
//  LandmarkRowView.swift
//  landmarks
//
//  Created by Alejandro Sanabria on 20/02/23.
//

import SwiftUI

struct LandmarkRowView: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .padding(.horizontal, 16)
            }
        }
    }
}

struct LandmarkRowView_Previews: PreviewProvider {
    static var viewModel = LandmarkViewModel()
    
    static var previews: some View {
        Group {
            LandmarkRowView(landmark: viewModel.landmarks[0])
            
            LandmarkRowView(landmark: viewModel.landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

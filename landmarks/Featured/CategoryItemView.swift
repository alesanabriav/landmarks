//
//  CategoryItemView.swift
//  landmarks
//
//  Created by Alejandro Sanabria on 20/02/23.
//

import SwiftUI

struct CategoryItemView: View {
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(6)
            Text(landmark.name)
                .foregroundColor(.black)
        }
        .padding(.leading, 12)
    }
}

struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView(landmark: LandmarkViewModel().landmarks[0])
    }
}

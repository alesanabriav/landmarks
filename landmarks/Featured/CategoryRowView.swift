//
//  CategoryRowView.swift
//  landmarks
//
//  Created by Alejandro Sanabria on 20/02/23.
//

import SwiftUI

struct CategoryRowView: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 12)
                .padding(.top, 12)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { item in
                        NavigationLink {
                            LandmarkDetailView(landmark: item)
                        } label: {
                            CategoryItemView(landmark: item)
                        }
                    }
                }
            }
            .frame(height: 190)
        }
    }
}

struct CategoryRowView_Previews: PreviewProvider {
    static var landmarks = LandmarkViewModel().landmarks
    
    static var previews: some View {
        CategoryRowView(
            categoryName: landmarks[0].category.rawValue, items: Array(landmarks.prefix(4)))
    }
}

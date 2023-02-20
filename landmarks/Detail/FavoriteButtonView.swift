//
//  FavoriteButtonView.swift
//  landmarks
//
//  Created by Alejandro Sanabria on 20/02/23.
//

import SwiftUI

struct FavoriteButtonView: View {
    
    @Binding var value: Bool
    
    var body: some View {
        Button {
            value.toggle()
        } label: {
            Image(systemName: value ? "star.fill" : "star")
                .foregroundColor(value ? .yellow : .gray)
        }

    }
}

struct FavoriteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButtonView(value: .constant(true))
    }
}

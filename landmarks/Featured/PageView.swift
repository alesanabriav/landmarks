//
//  PageView.swift
//  landmarks
//
//  Created by Alejandro Sanabria on 20/02/23.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    
    var body: some View {
        PageViewController(pages: pages)
            .onAppear(perform: getPages)
    }
    
    func getPages() {
        print("PAGES \(pages.count)")
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: LandmarkViewModel().features.map { FeatureCardView(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}

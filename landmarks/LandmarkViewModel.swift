//
//  LandmarkViewModel.swift
//  landmarks
//
//  Created by Alejandro Sanabria on 20/02/23.
//

import Foundation
import SwiftUI

final class LandmarkViewModel: ObservableObject {
    
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    @Published var showFavoritesOnly: Bool = false
    var filtered: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var categories: [String: [Landmark]] {
        Dictionary(grouping: landmarks, by: { $0.category.rawValue })
    }
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Error getting \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Error loading \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Error parsing \(filename) as \(T.self):\n\(error)")
    }
}

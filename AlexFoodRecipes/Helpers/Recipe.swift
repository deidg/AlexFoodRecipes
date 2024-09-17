//
//  Recipe.swift
//  AlexFoodRecipes
//
//  Created by Alex on 14.09.2024.
//

import Foundation


struct Recipe: Codable {
    let image: String
    let rating: Double
    let name: String
    let time: Int
    
    enum CodingKeys: String, CodingKey {
        case image, rating, name
        case time
    }
}



//
//  Recipe.swift
//  AlexFoodRecipes
//
//  Created by Alex on 14.09.2024.
//

import Foundation


struct Recipe: Codable {
    let imageURL: String
    let rating: Double
    let name: String
    let cookingTime: Int
    let cuisine: String
    
    enum CodingKeys: String, CodingKey {
        case imageURL, rating, name, cuisine
        case cookingTime
    }
}



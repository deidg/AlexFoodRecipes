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
    
    enum CodingKeys: String, CodingKey {
        case imageURL, rating, name
        case cookingTime
    }
}



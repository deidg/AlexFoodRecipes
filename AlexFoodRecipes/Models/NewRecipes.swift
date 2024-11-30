//
//  NewRecipes.swift
//  AlexFoodRecipes
//
//  Created by Alex on 29.10.2024.
//

import Foundation

struct NewRecipes: Codable {
    let recipeName, cuisine: String
    let rating: Int
    let author: String
    let imageURL: String
    let cookingTime: Int
    
    enum CodingKeys: String, CodingKey {
        case recipeName = "RecipeName"
        case cuisine = "Cuisine"
        case rating = "Rating"
        case author = "Author"
        case imageURL = "ImageURL"
        case cookingTime
    }
}

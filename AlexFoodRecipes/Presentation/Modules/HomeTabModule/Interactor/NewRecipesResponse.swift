//
//  NewRecipesResponse.swift
//  AlexFoodRecipes
//
//  Created by Alex on 11.10.2024.
//


import Foundation

// MARK: - WelcomeElement
struct NewRecipesResponse: Codable {
    let recipeName, cuisine: String
    let rating: Int
    let author: String
    let image: String
    let cookingTime: Int

    enum CodingKeys: String, CodingKey {
        case recipeName = "RecipeName"
        case cuisine = "Cuisine"
        case rating = "Rating"
        case author = "Author"
        case image = "Image"
        case cookingTime
    }
}

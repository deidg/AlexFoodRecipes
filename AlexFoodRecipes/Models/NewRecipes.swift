//
//  NewRecipes.swift
//  AlexFoodRecipes
//
//  Created by Alex on 29.10.2024.
//

import Foundation

struct NewRecipes: Codable {
    
    
    //    struct NewRecipesResponse: Codable {
    let recipeName, cuisine: String
    let rating: Int
    let author: String
    let imageURL: String
    let cookingTime: Int
    
    enum CodingKeys: String, CodingKey {
//        case imageURL, recipeName, cuisine, author
//        case cookingTime, rating
        
        case recipeName = "RecipeName"
        case cuisine = "Cuisine"
        case rating = "Rating"
        case author = "Author"
        case imageURL = "ImageURL"
        case cookingTime
    }
}



//    let imageURL: String
//    let rating: Double
//    let name: String  // name =-> authorName
//    let cookingTime: Int
//    let author: String
//
//    enum CodingKeys: String, CodingKey {
//        case imageURL, rating, name, author     //  TODO: change name -> authorName
//        case cookingTime
//    }
//}

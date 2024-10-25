//
//  NewRecipesResponse.swift
//  AlexFoodRecipes
//
//  Created by Alex on 11.10.2024.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

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

//typealias NewRecipesResponse = [NewRecipesResponse]
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//            return true
//    }
//
//    public var hashValue: Int {
//            return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//            let container = try decoder.singleValueContainer()
//            if !container.decodeNil() {
//                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//            }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//            var container = encoder.singleValueContainer()
//            try container.encodeNil()
//    }
//}

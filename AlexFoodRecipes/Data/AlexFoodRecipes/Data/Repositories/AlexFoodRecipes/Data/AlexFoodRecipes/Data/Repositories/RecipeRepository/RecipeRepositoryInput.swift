//
//  RecipeRepositoryInput.swift
//  AlexFoodRecipes
//
//  Created by Alex on 14.09.2024.
//

import Foundation

protocol RecipeRepositoryInput {
    
    func fetchRecipes(handler: Command<[Recipe]?>)
    func cancelAllTaskInRecipeRepository()
    
    
}

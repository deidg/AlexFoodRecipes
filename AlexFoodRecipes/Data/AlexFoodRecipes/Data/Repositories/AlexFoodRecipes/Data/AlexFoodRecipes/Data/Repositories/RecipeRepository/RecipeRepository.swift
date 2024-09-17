//
//  RecipeRepository.swift
//  AlexFoodRecipes
//
//  Created by Alex on 14.09.2024.
//

import Foundation

struct RecipeRepository: RecipeRepositoryInput {
    let networking: NetworkingProtocol
    
    func fetchRecipes(handler: Command<[Recipe]?>) {
        let endpoint = RequestItem.getRecipe
        networking.sendRequest(endPointItem: endpoint, handler: handler)
    }
    
    func cancelAllTaskInRecipeRepository() {
        networking.cancelAllTasksNetworkingAF()
    }
    
    
}

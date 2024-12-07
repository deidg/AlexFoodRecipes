//
//  RecipeRepository.swift
//  AlexFoodRecipes
//
//  Created by Alex on 14.09.2024.
//

import Foundation


struct RecipeRepository: RecipeRepositoryInput {
    let networking: NetworkingProtocol
  
  init(networking: NetworkingProtocol) {
    self.networking = networking
  }
    
    func fetchRecipes(handler: Command<[Recipe]?>) {
        let endpoint = RequestItem.getRecipe
        networking.sendRequestForAllRecipes(endPointItem: endpoint, handler: handler)
    }
    func fetchNewRecipes(handler: Command<[NewRecipes]?>) {   //<[Recipe]?>) {
        let endpoint = RequestItem.getNewRecipes
        networking.sendRequestForNewRecipes(endPointItem: endpoint, handler: handler)
    }
    func cancelAllTaskInRecipeRepository() {
        networking.cancelAllTasksNetworkingAF()
    }
}

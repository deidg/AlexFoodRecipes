//
//  HomeTabInteractor.swift
//  AlexFoodRecipes
//
//  Created by Alex on 22.10.2024.
//

import Foundation

class HomeTabInteractor: InteractorType, HomeTabInteractorInput {
  
    
    
    
    weak var output: HomeTabInteractorOutput?
    var recipesRepository: RecipeRepositoryInput?
    
  
    required init() {}
    
    
    func getAllRecipes() {
        recipesRepository?.fetchRecipes(handler: .init(with: { [weak self] recipes in
            guard let recipes, let self else { return }
            
//            output?.proceedResultForAllRecipes(recipes)
            output?.proceedResultForAllRecipes(recipes)

        }))
    }
    
    func getNewRecipes() {
        recipesRepository?.fetchNewRecipes(handler: .init(with: { [weak self] newRecipes in
            guard let newRecipes, let self else { return }
            
            output?.proceedResultForNewRecipes(newRecipes)
        }))
    }
    
}

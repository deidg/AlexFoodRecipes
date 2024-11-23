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
    
    func getRecipes() {
        
        let dispatchGroup = DispatchGroup()
        
        var recipesArr: [Recipe] = []
        var newRecipesArr: [NewRecipes] = []
        
        dispatchGroup.enter()
        
        recipesRepository?.fetchRecipes(handler: .init(with: { [weak self] recipes in
            guard let recipes, let self else { return }
            recipesArr = recipes
            dispatchGroup.leave()
        }))
        dispatchGroup.enter()
        
        recipesRepository?.fetchNewRecipes(handler: .init(with: { [weak self] newRecipes in
            guard let newRecipes, let self else { return }
            newRecipesArr = newRecipes
            dispatchGroup.leave()
        }
                                                         ))
        dispatchGroup.notify(queue: .main) { [weak self] in
            self?.output?.proceedResultRecipes(recipesArr, newRecipesArr)
        }
    }
}

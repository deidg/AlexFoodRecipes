//
//  HomeTabInteractorOutput.swift
//  AlexFoodRecipes
//
//  Created by Alex on 22.10.2024.
//

import Foundation

protocol HomeTabInteractorOutput: AnyInteractorOutput {
    func proceedRecipesResult(_ recipes: [Recipe])
    
    
}

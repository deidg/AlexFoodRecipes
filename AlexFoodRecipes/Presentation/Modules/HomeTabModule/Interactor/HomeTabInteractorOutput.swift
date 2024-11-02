//
//  HomeTabInteractorOutput.swift
//  AlexFoodRecipes
//
//  Created by Alex on 22.10.2024.
//

import Foundation

protocol HomeTabInteractorOutput: AnyInteractorOutput {
    func proceedResultForAllRecipes(_ recipes: [Recipe])
    
    func proceedResultForNewRecipes(_ newRecipes: [NewRecipes])
}

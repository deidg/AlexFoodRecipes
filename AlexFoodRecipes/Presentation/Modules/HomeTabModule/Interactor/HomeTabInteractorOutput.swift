//
//  HomeTabInteractorOutput.swift
//  AlexFoodRecipes
//
//  Created by Alex on 22.10.2024.
//

import Foundation

protocol HomeTabInteractorOutput: AnyInteractorOutput {
    
    func proceedResultRecipes(_ recipes: [Recipe], _ newRecipes: [NewRecipes])
    
//    func proceedResultForAllRecipes(_ recipes: [Recipe])
//    
//    func proceedResultForNewRecipes(_ newRecipes: [NewRecipes])
}

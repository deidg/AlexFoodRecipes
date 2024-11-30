//
//  HomeTabViewOutput.swift
//  AlexFoodRecipes
//
//  Created by Alex on 22.10.2024.
//

import Foundation

protocol HomeTabViewOutput: AnyViewOutput {
    
    var allRecipes: [Recipe] { get }
    var newRecipes: [NewRecipes] { get }
    var filteredRecipesByChosenCuisine: [Recipe] { get }
    
    func filterRecipeResultsByCuisine(_ cuisine: String)
    
}




//
//  HomeTabModuleAssembly.swift
//  AlexFoodRecipes
//
//  Created by Alex on 22.10.2024.
//

import Foundation
import Swinject

class HomeTabModuleAssembly: BaseModuleAssembly {
    
    override func assemble(container: Container) {
        fullModuleRegistration(
            moduleType: HomeTabModule.self,
            container: container,
            interactorSetup: {
                $1.recipesRepository = $0.resolve(RecipeRepositoryInput.self)                
            })
    }
    
}

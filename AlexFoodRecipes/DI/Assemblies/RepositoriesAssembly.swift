//
//  RepositoriesAssembly.swift
//  AlexFoodRecipes
//
//  Created by Alex on 22.10.2024.
//

import Swinject

class RepositoriesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RecipeRepositoryInput.self) { (rep) -> RecipeRepositoryInput in
            return RecipeRepository(networking: rep.resolve(NetworkingProtocol.self)!)
        }
    }
    
    
}

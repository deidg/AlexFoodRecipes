//
//  MainTabBarAssembly.swift
//  AlexFoodRecipes
//
//  Created by Alex on 25.10.2024.
//

import Foundation
import Swinject


class MainTabBarAssembly: BaseModuleAssembly {
    
    override func assemble(container: Container) {
        fullModuleRegistration(
            moduleType: MainTabBarModule.self,
            container: container,
            interactorSetup: { _,_ in
            
        })
    }
}

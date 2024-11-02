//
//  HomeTabPresenter.swift
//  AlexFoodRecipes
//
//  Created by Alex on 22.10.2024.
//

import Foundation
import UIKit

class HomeTabPresenter: PresenterType, HomeTabModuleInput {
    typealias ModuleOutput = HomeTabModuleOutput
    
    weak var moduleOutput: HomeTabModuleOutput?
    weak var view: HomeTabViewInput?
    var router: HomeTabRouterInput!
    var interactor: HomeTabInteractorInput!
   
    func handleTimeOutNotificationUpdate() {
        
    }
    
    required init() {}
    
}
extension HomeTabPresenter: HomeTabViewOutput {
    func onViewDidLoad() {
        interactor.getAllRecipes()
        interactor.getNewRecipes()
    }
}

extension HomeTabPresenter: HomeTabInteractorOutput {
    
    
    func proceedResultForAllRecipes(_ recipes: [Recipe]) {
        view?.populateWith(state: .result(allRecipes: recipes))
    }
    
    func proceedResultForNewRecipes(_ newRecipes: [NewRecipes]) {
        view?.populateWithNewRecipes(state: .newRecipesResult(newRecipes: newRecipes))
    }
    
   
}



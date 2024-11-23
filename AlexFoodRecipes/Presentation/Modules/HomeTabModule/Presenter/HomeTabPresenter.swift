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
    

    
    
    private func filterRecipesToCuisines(allRecipes: [Recipe]) {
//        var cuisinesNamesArr: [String] = []
         
        var cuisinesNamesArr = Array(Set(allRecipes.map { $0.cuisine }))
//        print("Im printing cuisinesNamesArr: \(cuisinesNamesArr)")
        

        view?.sendCusisineArray(cuisinesNamesArr: cuisinesNamesArr)

    }
    
    
}
extension HomeTabPresenter: HomeTabViewOutput {
    func onViewDidLoad() {
//        interactor.getAllRecipes()
//        interactor.getNewRecipes()
        
        interactor.getRecipes()
        
    }
}

extension HomeTabPresenter: HomeTabInteractorOutput {
    
    
//    func proceedResultForAllRecipes(_ recipes: [Recipe]) {
    func proceedResultRecipes(_ recipes: [Recipe], _ newRecipes: [NewRecipes]) {
        view?.populateWith(state: .result(allRecipes: recipes, newRecipes: newRecipes))
        
        filterRecipesToCuisines(allRecipes: recipes)
    
    }
    
//    func proceedResultForNewRecipes(_ newRecipes: [NewRecipes]) {
//        view?.populateWithNewRecipes(state: .newRecipesResult(newRecipes: newRecipes))
//    }
    
   
}



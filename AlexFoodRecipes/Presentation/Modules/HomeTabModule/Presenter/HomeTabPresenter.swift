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
    
    var allRecipes: [Recipe] = []
    var newRecipes: [NewRecipes] = []
    var filteredRecipesByChosenCuisine: [Recipe] = []

    func handleTimeOutNotificationUpdate() {
    }
    
    required init() {}
   
    private func filterRecipesToCuisines(allRecipes: [Recipe]) {
         
        var cuisinesNamesArr = Array(Set(allRecipes.map { $0.cuisine }))

        view?.sendCusisineArray(cuisinesNamesArr: cuisinesNamesArr)

    }
}
extension HomeTabPresenter: HomeTabViewOutput {
    func filterRecipeResultsByCuisine(_ cuisine: String) {
        if cuisine == "All" {
            filteredRecipesByChosenCuisine = allRecipes
        } else {
            filteredRecipesByChosenCuisine = allRecipes.filter { $0.cuisine == cuisine }
        }
        view?.populateWith(state: .result)
    }
    
    func onViewDidLoad() {
        interactor.getRecipes()
    }
}

extension HomeTabPresenter: HomeTabInteractorOutput {
    
    func proceedResultRecipes(_ allRecipes: [Recipe], _ newRecipes: [NewRecipes]) {
        view?.populateWith(state: .result)
        
        self.allRecipes = allRecipes
        filteredRecipesByChosenCuisine = allRecipes

        self.newRecipes = newRecipes
        
        filterRecipesToCuisines(allRecipes: allRecipes)    
    }
}



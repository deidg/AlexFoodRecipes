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
    
    
//    let customSegmentedControl = CustomSegmentedControl()
//    customSegmentedControl.delegate = self
    
   
    func handleTimeOutNotificationUpdate() {
    }
    
    required init() {}
    

    
    
    private func filterRecipesToCuisines(allRecipes: [Recipe]) {
//        var cuisinesNamesArr: [String] = []
         
        var cuisinesNamesArr = Array(Set(allRecipes.map { $0.cuisine }))
//        print("Im printing cuisinesNamesArr: \(cuisinesNamesArr)")
        

        view?.sendCusisineArray(cuisinesNamesArr: cuisinesNamesArr)

    }
    
//    func showChosenCuisine(chosenCuisine: String) {
//        print("переданное имя - \(chosenCuisine)")
//    }
    
    
//    private func filterForCuisine(allrecipes: [Recipe], chosenCuisine: String) {
//        
//        var filtredArrayByCuisine: [Recipe] = allrecipes.filter { $0.cuisine == chosenCuisine }
//        
//    }
    
    
}
extension HomeTabPresenter: HomeTabViewOutput {
    func filterRecipeResultsByCuisine(_ cuisine: String) {
        
        if cuisine == "All" {
            
            filteredRecipesByChosenCuisine = allRecipes
        } else {
            
            filteredRecipesByChosenCuisine = allRecipes.filter { $0.cuisine == cuisine }
            
            print (filteredRecipesByChosenCuisine)
            
        }
        view?.populateWith(state: .result)
    }
    
    func onViewDidLoad() {
//        interactor.getAllRecipes()
//        interactor.getNewRecipes()
        
        interactor.getRecipes()
        
    }
}

extension HomeTabPresenter: HomeTabInteractorOutput {
    
    
//    func proceedResultForAllRecipes(_ recipes: [Recipe]) {
    func proceedResultRecipes(_ allRecipes: [Recipe], _ newRecipes: [NewRecipes]) {
        view?.populateWith(state: .result)
        
        self.allRecipes = allRecipes
        filteredRecipesByChosenCuisine = allRecipes

        self.newRecipes = newRecipes
        
        filterRecipesToCuisines(allRecipes: allRecipes)
    
    }

}



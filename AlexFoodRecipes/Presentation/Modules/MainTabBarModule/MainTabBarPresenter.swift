//
//  MainTabBarPresenter.swift
//  AlexFoodRecipes
//
//  Created by Alex on 25.10.2024.
//

import Foundation
import UIKit

class MainTabBarPresenter: PresenterType, MainTabBarModuleInput {
    typealias ModuleOutput = MainTabBarModuleOutput
    
    weak var moduleOutput: MainTabBarModuleOutput?
    weak var view: MainTabBarViewInput?
    var router: MainTabBarRouterInput!
    var interactor: MainTabBarInteractorInput!
   
    required init() {}
    
}
extension MainTabBarPresenter: MainTabBarViewOutput {
    func onViewDidLoad() {
//        interactor.
    }
}

extension MainTabBarPresenter: MainTabBarInteractorOutput {
    
}


//
//  HomeTabModule.swift
//  AlexFoodRecipes
//
//  Created by Alex on 22.10.2024.
//

import Foundation

class HomeTabModule: BaseModule<
HomeTabVC,
HomeTabInteractor,
HomeTabPresenter,
HomeTabRouter,
HomeTabModuleInput,
HomeTabModuleAssembly> {
  override var storyboardID: String {
    return "HomeTab"
  }
}

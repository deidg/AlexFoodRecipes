//
//  PresenterProvider.swift
//  AlexFoodRecipes
//
//  Created by Vlad on 08.09.2024.
//

import Foundation

protocol PresenterProvider {
  func getPresenter() -> AnyPresenter?
}

//
//  PresenterType.swift
//  AlexFoodRecipes
//
//  Created by Vlad on 08.09.2024.
//

import Foundation

protocol PresenterType: AnyPresenter, AnyViewOutput, AnyInteractorOutput, AnyModuleInput {
  associatedtype View
  associatedtype Router
  associatedtype Interactor
  
  var moduleOutput: ModuleOutput? { get set }
  var view: View? { get set }
  var router: Router! { get set }
  var interactor: Interactor! { get set }
  
  init()
}

extension PresenterType {
  func setViperProperties(view: View, router: Router, interactor: Interactor) {
    self.view = view
    self.router = router
    self.interactor = interactor
  }
}

extension PresenterType {
  func setModuleOutput(_ moduleOutput: ModuleOutput) {
    self.moduleOutput = moduleOutput
  }
}

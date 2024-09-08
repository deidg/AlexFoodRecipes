//
//  BaseModule.swift
//  AlexFoodRecipes
//
//  Created by Vlad on 08.09.2024.
//

import UIKit

class BaseModule<
  V: AnyViewController,
  I: InteractorType,
  P: PresenterType,
  R: BaseRouter,
  ModuleInput,
  ModuleAssembly: BaseModuleAssembly>: AnyModule {
  
  typealias View = V
  typealias Interactor = I
  typealias Presenter = P
  typealias Router = R
  typealias ModuleInputType = ModuleInput
  typealias ModuleAssemblyType = ModuleAssembly
  
  var viewController: V?
  var moduleInput: ModuleInput?
  
  var vcIdentifier: String { return String(describing: V.self) }
  
  required init() {
    logger("\(String(describing: type(of: self))): instantiated")
  }
  
  deinit {
    logger("\(String(describing: type(of: self))): deinstantiated")
  }
}

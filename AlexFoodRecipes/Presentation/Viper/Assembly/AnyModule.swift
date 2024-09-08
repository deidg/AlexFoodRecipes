//
//  AnyModule.swift
//  AlexFoodRecipes
//
//  Created by Vlad on 08.09.2024.
//

import UIKit
import Swinject

protocol ViperModuleAssembly: Assembly {
  init()
}

protocol AnyModule: AnyObject {
  associatedtype View: AnyViewController
  associatedtype Interactor: InteractorType
  associatedtype Presenter: PresenterType
  associatedtype Router: BaseRouter
  associatedtype ModuleInputType
  associatedtype ModuleAssemblyType: ViperModuleAssembly
  
  init()
  
  var vcIdentifier: String { get }
  var viewController: View? { get set }
  var moduleInput: ModuleInputType? { get set }
}

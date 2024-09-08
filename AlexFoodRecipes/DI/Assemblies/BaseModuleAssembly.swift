//
//  BaseModuleAssembly.swift
//  AlexFoodRecipes
//
//  Created by Vlad on 08.09.2024.
//

import Swinject

class BaseModuleAssembly: ViperModuleAssembly {
  
  required init() {}
  
  /// Override this method and call fullModuleRegistration<M: AnyModule>
  func assemble(container: Container) {
  }
  
  func loaded(resolver: Resolver) {
    logger("\(String(describing: type(of: self))): Module has been registered")
  }
  
  /// Register generic viper module classes in Swinject container.
  /// You can pass here closures that contain code for setting additional dependecies
  ///
  /// **Example to set additional service property to Interactor**
  ///
  ///    fullModuleRegistration(
  ///      moduleType: ExampleModule.self,
  ///      container: container,
  ///      interactorSetup: { $1.exampleService = $0.resolve(ExampleServiceInput.self) }
  ///    )
  ///
  /// - parameters:
  ///     - moduleType: Module type that should be registered
  ///     - container: Swinject Container
  ///     - name: Allows to define different configurations for a module.
  ///     - viewSetup: ViewController setup closure
  ///     - interactorSetup: Interactor setup closure
  ///     - presenterSetup: Presenter setup closure
  ///     - routerSetup: Router setup closure
  func fullModuleRegistration<M: AnyModule>(
    moduleType: M.Type,
    container: Container,
    name: String? = nil,
    moduleSetup: ((Resolver, M) -> Void)? = nil,
    viewSetup: ((Resolver, M.View) -> Void)? = nil,
    interactorSetup: ((Resolver, M.Interactor) -> Void)? = nil,
    presenterSetup: ((Resolver, M.Presenter) -> Void)? = nil,
    routerSetup: ((Resolver, M.Router) -> Void)? = nil) {
//      registerModule(moduleType: M.self, container: container, name: name, setup: moduleSetup)
//      registerViewFor(moduleType: M.self, container: container, name: name, setup: viewSetup)
//      registerInteractorFor(moduleType: M.self, container: container, name: name, setup: interactorSetup)
//      registerPresenterFor(moduleType: M.self, container: container, name: name, setup: presenterSetup)
//      registerRouterFor(moduleType: M.self, container: container, name: name, setup: routerSetup)
  }
}


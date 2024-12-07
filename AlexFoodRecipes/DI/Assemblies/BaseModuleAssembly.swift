//
//  BaseModuleAssembly.swift
//  AlexFoodRecipes
//
//  Created by Vlad on 08.09.2024.
//

import Swinject
import UIKit

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
            registerModule(moduleType: M.self, container: container, name: name, setup: moduleSetup)
            registerViewFor(moduleType: M.self, container: container, name: name, setup: viewSetup)
            registerInteractorFor(moduleType: M.self, container: container, name: name, setup: interactorSetup)
            registerPresenterFor(moduleType: M.self, container: container, name: name, setup: presenterSetup)
            registerRouterFor(moduleType: M.self, container: container, name: name, setup: routerSetup)
        }
}

extension BaseModuleAssembly {
    func registerModule<M: AnyModule>(moduleType: M.Type,
                                      container: Container,
                                      name: String? = nil,
                                      setup: ((Resolver, M) -> Void)? = nil) {
        container.register(moduleType, name: name) {[weak self] _ in M() }
            .initCompleted {
                $1.viewController = $0.resolve(M.View.self, name: name)
                $1.moduleInput = $0.resolve(M.ModuleInputType.self, name: name)
                setup?($0, $1)
            }
    }
    
    func registerViewFor<M: AnyModule>(moduleType: M.Type,
                                       container: Container,
                                       name: String? = nil,
                                       setup: ((Resolver, M.View) -> Void)? = nil) {
        container.register(M.View.Presenter.self, name: name) {
            $0.resolve(M.Presenter.self, name: name) as! M.View.Presenter
        }
        container.register(M.View.self, name: name) { [weak self] in
            let module = $0.resolve(M.self, name: name)!
            let storyboard = UIStoryboard(name: module.storyboardID, bundle: nil)
            
            let vc = storyboard.instantiateViewController(withIdentifier: module.vcIdentifier) as? M.View
            
            
            if vc != nil {
                return vc!
            } else {
                fatalError("Storyboard: \(module.storyboardID) failed to init view controller with id \(module.vcIdentifier)")
            }}
        .initCompleted { [weak self] (r, vc) in
            let presenter = r.resolve(M.View.Presenter.self, name: name)!
            vc.setPresenter(presenter)
            vc.modalPresentationStyle = .fullScreen
            setup?(r, vc)
        }
    }
    
    func registerInteractorFor<M: AnyModule>(moduleType: M.Type,
                                             container: Container,
                                             name: String? = nil,
                                             setup: ((Resolver, M.Interactor) -> Void)? = nil) {
        container.register(M.Interactor.Output.self, name: name) {
            $0.resolve(M.Presenter.self, name: name) as! M.Interactor.Output
        }
        container.register(M.Interactor.self, name: name) { _ in M.Interactor() }
            .initCompleted {
                $1.setOutput($0.resolve(M.Interactor.Output.self, name: name)!)
                setup?($0, $1)
            }
    }
    
    func registerPresenterFor<M: AnyModule>(moduleType: M.Type,
                                            container: Container,
                                            name: String? = nil,
                                            setup: ((Resolver, M.Presenter) -> Void)? = nil) {
        container.register(M.ModuleInputType.self, name: name) {
            $0.resolve(M.Presenter.self, name: name) as! M.ModuleInputType
        }
        container.register(M.Presenter.View.self, name: name) {
            $0.resolve(M.View.self, name: name) as! M.Presenter.View
        }
        container.register(M.Presenter.Router.self, name: name) {
            $0.resolve(M.Router.self, name: name) as! M.Presenter.Router
        }
        container.register(M.Presenter.Interactor.self, name: name) {
            $0.resolve(M.Interactor.self, name: name) as! M.Presenter.Interactor
        }
        container.register(M.Presenter.self, name: name) {_ in M.Presenter() }
            .initCompleted({
                $1.setViperProperties(view: $0.resolve(M.Presenter.View.self, name: name)!,
                                      router: $0.resolve(M.Presenter.Router.self, name: name)!,
                                      interactor: $0.resolve(M.Presenter.Interactor.self, name: name)!)
                setup?($0, $1)
            })
    }
    
    func registerRouterFor<M: AnyModule>(moduleType: M.Type,
                                         container: Container,
                                         name: String? = nil,
                                         setup: ((Resolver, M.Router) -> Void)? = nil) {
        container.register(M.Router.self, name: name) {
            let view: TransitionHandler = $0.resolve(M.View.self, name: name)!
            
            
            return M.Router(transitionHandler: view)
        }.initCompleted { setup?($0, $1) }
    }
}

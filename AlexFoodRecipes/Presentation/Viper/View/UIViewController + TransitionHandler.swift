//
//  UIViewController + TransitionHandler.swift
//  AlexFoodRecipes
//
//  Created by Alex on 22.10.2024.
//
import UIKit


extension UIViewController: TransitionHandler {
    
    func push(vc: UIViewController) {
        guard let navController = navigationController else { return }
        navController.pushViewController(vc, animated: true)
    }
    func pushModule<M>(moduleType: M.Type,
                       swinjectName: String? = nil,
                       setup: ModuleSetup<M>? = nil) where M: AnyModule {
        guard let navController = navigationController else { return }
        let vc = setupModuleAndViewController(moduleType: moduleType, swinjectName: swinjectName, setup: setup)
        navController.pushViewController(vc, animated: true)
    }
    func presentModule<M>(moduleType: M.Type,
                          swinjectName: String? = nil,
                          animateSubtype: CATransitionSubtype? = nil,
                          setup: ModuleSetup<M>? = nil) where M: AnyModule {
        let vc = setupModuleAndViewController(moduleType: moduleType, swinjectName: swinjectName, setup: setup)
        if animateSubtype != nil {
            let transition = CATransition()
            transition.duration = 0.4
            transition.type = CATransitionType.moveIn
            transition.subtype = animateSubtype
            view.window?.layer.add(transition, forKey: kCATransition)
        }
        present(vc, animated: animateSubtype == nil, completion: nil)
    }
    func closeModule(completion: Command<Void>?) {
        DispatchQueue.main.async { [weak self] in
            if self?.presentingViewController != nil {
                self?.dismiss(animated: true, completion: {
                    completion?.perform()
                })
            } else if let nav = self?.navigationController {
                if nav.viewControllers.count == 1 && self?.tabBarController != nil {
                    nav.dismiss(animated: true) {
                        completion?.perform()
                    }
                } else {
                    nav.popViewController(animated: true)
                    completion?.perform()
                }
            } else {
                return
            }
        }
    }
    func closeModuleWithoutAnimation(completion: Command<Void>?) {
        DispatchQueue.main.async { [weak self] in
            if self?.presentingViewController != nil {
                self?.dismiss(animated: true, completion: {
                    completion?.perform()
                })
            } else if let nav = self?.navigationController {
                if nav.viewControllers.count == 1 && self?.tabBarController != nil {
                    nav.dismiss(animated: false) {
                        completion?.perform()
                    }
                } else {
                    nav.popViewController(animated: false)
                    completion?.perform()
                }
            } else {
                return                            
            }
        }
    }
}

private extension UIViewController {
    func setupModuleAndViewController<M: AnyModule>(moduleType: M.Type,
                                                    swinjectName: String? = nil,
                                                    setup: ModuleSetup<M>? = nil) -> UIViewController {
        let module = Dependencies.shared.initModule(type: M.self, name: swinjectName)
        guard let viewController = module.viewController, let input = module.moduleInput else {
            fatalError("ERROR: Module \(String(describing: moduleType)) has not been correctly assemblied!")
        }
        setup?(input)
        return viewController
    }
}

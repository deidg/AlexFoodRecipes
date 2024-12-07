//
//  BaseRouter.swift
//  AlexFoodRecipes
//
//  Created by Vlad on 08.09.2024.
//

import UIKit

class BaseRouter: RouterType {
    
    private(set) weak var transitionHandler: TransitionHandler?
    
    required init(transitionHandler: TransitionHandler) {
        self.transitionHandler = transitionHandler
    }
    
    func pushModule<M: AnyModule>(moduleType: M.Type, swinjectName: String? = nil, setup: ModuleSetup<M>? = nil) {
        transitionHandler?.pushModule(moduleType: moduleType, swinjectName: swinjectName, setup: setup)
    }
    
    func presentModule<M: AnyModule>(moduleType: M.Type, swinjectName: String? = nil, setup: ModuleSetup<M>? = nil) {
        transitionHandler?.presentModule(moduleType: moduleType, swinjectName: swinjectName, animateSubtype: nil, setup: setup)
    }
    
    func presentModuleOnTabBarVC<M: AnyModule>(
        moduleType: M.Type,
        swinjectName: String? = nil,
        animateSubtype: CATransitionSubtype? = nil,
        setup: ModuleSetup<M>? = nil) {
            guard let tabBarVC: UIViewController = UIApplication.shared.keyWindowInConnectedScenes?.rootViewController else { return }
            
            tabBarVC.presentModule(moduleType: moduleType, swinjectName: swinjectName, animateSubtype: animateSubtype, setup: setup)
        }
    
    func push(vc: UIViewController) {
        transitionHandler?.push(vc: vc)
    }
    
    func closeModule(completion: Command<Void>? = nil) {
        transitionHandler?.closeModule(completion: completion)
    }
    
    func closeModuleWithoutAnimation(completion: Command<Void>? = nil) {
        transitionHandler?.closeModuleWithoutAnimation(completion: completion)
    }
}

extension UIApplication {
    var keyWindowInConnectedScenes: UIWindow? {
        return connectedScenes
            .map { $0 as? UIWindowScene }
            .compactMap { $0 }
            .first?.windows
            .filter { $0.isKeyWindow }.first
    }
}

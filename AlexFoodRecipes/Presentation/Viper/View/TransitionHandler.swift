//
//  TransitionHandler.swift
//  AlexFoodRecipes
//
//  Created by Alex on 22.10.2024.
//

import Foundation
import UIKit

typealias ModuleSetup<M: AnyModule> = (M.ModuleInputType) -> Void

protocol TransitionHandler: AnyObject {
    func push(vc: UIViewController)
    func pushModule<M: AnyModule>(moduleType: M.Type, swinjectName: String?, setup: ModuleSetup<M>?)
    func presentModule<M: AnyModule>(moduleType: M.Type,
                                     swinjectName: String?,
                                     animateSubtype: CATransitionSubtype?,
                                     setup: ModuleSetup<M>?)
    func closeModule(completion: Command<Void>?)
    func closeModuleWithoutAnimation(completion: Command<Void>?)
}

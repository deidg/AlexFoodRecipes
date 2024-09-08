//
//  AnyModueInput.swift
//  AlexFoodRecipes
//
//  Created by Vlad on 08.09.2024.
//

import Foundation

protocol AnyModuleInput: AnyObject {
  associatedtype ModuleOutput
  /// Set module output for the current module
  ///
  /// - Parameter moduleOutput: ModuleOutput instance
  func setModuleOutput(_ moduleOutput: ModuleOutput)
}

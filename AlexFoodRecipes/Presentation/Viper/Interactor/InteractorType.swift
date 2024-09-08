//
//  InteractorType.swift
//  AlexFoodRecipes
//
//  Created by Vlad on 08.09.2024.
//

import Foundation

protocol InteractorType: AnyInteractorInput {
  associatedtype Output
  var output: Output? { get set }
  
  init()
}

extension InteractorType {
  func setOutput(_ output: Output) {
    self.output = output
  }
}

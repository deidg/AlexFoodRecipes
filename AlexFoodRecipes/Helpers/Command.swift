//
//  Command.swift
//  AlexFoodRecipes
//
//  Created by Alex on 14.09.2024.
//

import Foundation


struct Command<T> {
  private let action: (T) -> Void
  
  init(with action: @escaping (T) -> Void) {
    self.action = action
  }
  
  func perform(with value: T) {
    action(value)
  }
}

extension Command where T == Void {
  func perform() {
    perform(with: ())
  }
}

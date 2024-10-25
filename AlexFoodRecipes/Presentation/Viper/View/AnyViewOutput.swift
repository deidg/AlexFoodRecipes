//
//  AnyViewOutput.swift
//  AlexFoodRecipes
//
//  Created by Vlad on 08.09.2024.
//

import Foundation

protocol AnyViewOutput {
  func onViewDidLoad()
  func onViewWillAppear()
  func onViewDidAppear()
  func onViewWillDisappear()
  func onViewDidDisappear()
}

extension AnyViewOutput {  // экстенш протокола  - делает необзяталеьным
  func onViewDidLoad() {}
  func onViewWillAppear() {}
  func onViewDidAppear() {}
  func onViewWillDisappear() {}
  func onViewDidDisappear() {}
}

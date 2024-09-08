//
//  AnyViewOutput.swift
//  AlexFoodRecipes
//
//  Created by Vlad on 08.09.2024.
//

import Foundation

@objc protocol AnyViewOutputObjc {
  @objc func handleTimeOutNotificationUpdate()
}

protocol AnyViewOutput: AnyViewOutputObjc {
  func onViewDidLoad()
  func onViewWillAppear()
  func onViewDidAppear()
  func onViewWillDisappear()
  func onViewDidDisappear()
}

extension AnyViewOutput {
  func onViewDidLoad() {}
  func onViewWillAppear() {}
  func onViewDidAppear() {}
  func onViewWillDisappear() {}
  func onViewDidDisappear() {}
}

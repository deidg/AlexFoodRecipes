//
//  AnyViewInput.swift
//  AlexFoodRecipes
//
//  Created by Vlad on 08.09.2024.
//

import Foundation

protocol AnyViewInput: AnyObject, PresenterProvider {
//  var isLoaderVisible: Bool { get }
//  func showLoader()
//  func hideLoader()
}

extension AnyViewInput where Self: AnyViewController {
  func getPresenter() -> AnyPresenter? {
    
    guard let presenter = self.presenter as? AnyPresenter else { return nil }
    return presenter
  }
}

//
//  AnyViewController.swift
//  AlexFoodRecipes
//
//  Created by Vlad on 08.09.2024.
//

import UIKit

protocol AnyViewController: AnyViewInput where Self: UIViewController {
  associatedtype Presenter
  var presenter: Presenter? { get set }
  init()
}

extension AnyViewController {
  func setPresenter(_ presenter: Presenter) {
    self.presenter = presenter
  }
}

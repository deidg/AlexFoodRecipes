//
//  AnyPresenter.swift
//  AlexFoodRecipes
//
//  Created by Vlad on 08.09.2024.
//

import Foundation

protocol AnyPresenter: AnyObject, RouterProvider {
//  var alertService: AlertServiceInput! { get set }
}

extension AnyPresenter where Self: PresenterType {
  func getRouter() -> BaseRouter {
    guard let router = self.router as? BaseRouter else { fatalError() }
    return router
  }
}

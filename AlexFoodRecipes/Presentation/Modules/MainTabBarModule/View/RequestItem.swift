//
//  RequestItem.swift
//  AlexFoodRecipes
//
//  Created by Alex on 14.09.2024.
//

import Foundation
import Alamofire

enum RequestItem {
  case getRecipe
}

extension RequestItem: EndPointType {
  var baseURL: String {
    switch self {
    case .getRecipe:
      return "https://utmostroll-us.backendless.app/"
    }
  }
  
  var path: String {
    switch self {
    case .getRecipe:
      return "api/data/Recipes"
    }
  }
  
  var httpMethod: Alamofire.HTTPMethod {
    switch self {
    case .getRecipe:
      return .get
    }
  }
  
  var headers: Alamofire.HTTPHeaders? {
    switch self {
    case .getRecipe:
      return ["Content-Type": "application/json",
              "Accept": "application/json"]
    }
  }
  
  var parameters: Alamofire.Parameters? {
    switch self {
    case .getRecipe:
      return nil
    }
  }
  
  var url: URL {
    switch self {
    case .getRecipe:
      var urlString = self.baseURL + self.path
      urlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
      let url = URL(string: urlString)
      assert(url != nil, "Wrong baseURL or path.")
      return url!
    }
  }
  
  var encoding: Alamofire.ParameterEncoding {
    switch self {
    case .getRecipe:
      return JSONEncoding.default
    }
  }
  
  var authorization: AuthorizationType {
    switch self {
    case .getRecipe:
      return .none
    }
  }
  
  
}

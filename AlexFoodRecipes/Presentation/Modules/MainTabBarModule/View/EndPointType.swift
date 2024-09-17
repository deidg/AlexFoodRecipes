//
//  EndPointType.swift
//  AlexFoodRecipes
//
//  Created by Alex on 14.09.2024.
//

import Foundation
import Alamofire

protocol EndPointType {
  var baseURL: String { get }
  var path: String { get }
  var httpMethod: HTTPMethod { get }
  var headers: HTTPHeaders? { get }
  var parameters: Parameters? { get }
  var url: URL { get }
  var encoding: ParameterEncoding { get }
  var authorization: AuthorizationType { get }
}

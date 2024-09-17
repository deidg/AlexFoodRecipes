//
//  NetworkingProtocol.swift
//  AlexFoodRecipes
//
//  Created by Alex on 14.09.2024.
//

import Foundation
import Alamofire

protocol NetworkingProtocol {
  func sendRequest<Response: Codable>(endPointItem: EndPointType, handler: Command<Response?>)
  func cancelAllTasksNetworkingAF()
}


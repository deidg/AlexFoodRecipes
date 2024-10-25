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

/*
* Определяет методы для работы с сетью.
* Метод `sendRequest` - отвечает за отправку сетевого запроса.
* Принимает `endPointItem` - тип запроса из перечисления `RequestItem`.
* Принимает `handler` - блок кода, который будет вызван после получения ответа или ошибки.
* **(Предполагается)** Делает запрос на сервер и вызывает `handler` с полученными данными или ошибкой.
* Метод `cancelAllTasksNetworkingAF` - позволяет отменить все сетевые задачи. **(Вероятно, использует библиотеку Alamofire)**
*/

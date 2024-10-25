//
//  RecipeRepository.swift
//  AlexFoodRecipes
//
//  Created by Alex on 14.09.2024.
//

import Foundation

struct RecipeRepository: RecipeRepositoryInput {
    //структура, которрая реализует протокол `RecipeRepositoryInput`
    let networking: NetworkingProtocol
    
    func fetchRecipes(handler: Command<[Recipe]?>) {
        let endpoint = RequestItem.getRecipe
        networking.sendRequest(endPointItem: endpoint, handler: handler)
    }
    
    func fetchNewRecipes(handler: Command<[Recipe]?>) {
        let endpoint = RequestItem.getNewRecipes //getRecipe
//        networking.sendRequest(endPointItem: endpoint, handler: handler)
    }
    
    func cancelAllTaskInRecipeRepository() {
        networking.cancelAllTasksNetworkingAF()
    }
    
    
}


/*
 * Реализует протокол `RecipeRepositoryInput`.
 * Имеет свойство `networking` типа `NetworkingProtocol`.
 * Метод `fetchRecipes` - отвечает за получение рецептов.
 * Принимает `handler` - блок кода, который будет вызван после получения данных или ошибки.
 * Формирует `endpoint` (адрес запроса) на основе перечисления `RequestItem`.
 * Делегирует сетевой запрос объекту `networking`.
 
*/

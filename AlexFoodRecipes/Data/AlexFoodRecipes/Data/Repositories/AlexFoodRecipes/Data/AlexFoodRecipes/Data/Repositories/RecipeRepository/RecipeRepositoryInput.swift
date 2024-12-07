//
//  RecipeRepositoryInput.swift
//  AlexFoodRecipes
//
//  Created by Alex on 14.09.2024.
//

import Foundation

protocol RecipeRepositoryInput {  //Определяет интерфейс для работы с репозиторием рецептов.

    func fetchRecipes(handler: Command<[Recipe]?>)
    func fetchNewRecipes(handler: Command<[NewRecipes]?>)
    func cancelAllTaskInRecipeRepository()

}

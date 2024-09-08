//
//  Logger.swift
//  AlexFoodRecipes
//
//  Created by Vlad on 08.09.2024.
//

func logger(_ messg: String) {
  #if DEBUG
  print(messg)
  #endif
}

//
//  HomeTabViewInput.swift
//  AlexFoodRecipes
//
//  Created by Alex on 22.10.2024.
//

import Foundation

protocol HomeTabViewInput: AnyViewInput {
    func populateWith(state: HomeTabVC.State)
    
    func populateWithNewRecipes(state: HomeTabVC.State)
    
    
}

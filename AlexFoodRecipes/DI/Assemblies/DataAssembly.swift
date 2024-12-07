//
//  DataAssembly.swift
//  AlexFoodRecipes
//
//  Created by Vlad on 26.10.2024.
//

import Swinject

class DataAssembly: Assembly {
  func assemble(container: Container) {
    container.register(NetworkingProtocol.self) { _ in Networking() }
  }
  
  func loaded(resolver: Resolver) {
    logger("DataAssembly: Core elements have been registered.")
  }
}

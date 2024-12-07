//
//  Dependencies.swift
//  AlexFoodRecipes
//
//  Created by Alex on 22.10.2024.
//

import Swinject

final class Dependencies {
    static let shared = Dependencies()
    private let dataAssembler: Assembler
    private let domainAssembler: Assembler
    private let modulesAssembler: Assembler
    
    private init() {
        dataAssembler = Assembler([DataAssembly()], parent: nil, defaultObjectScope: .container)
        domainAssembler = Assembler([RepositoriesAssembly()], parent: dataAssembler)
        modulesAssembler = Assembler([], parent: domainAssembler)
    }
    
    var dataResolver: Resolver { return dataAssembler.resolver }
    var domainResolver: Resolver { return domainAssembler.resolver }
    
    func initModule<M: AnyModule>(type: M.Type, name: String? = nil) -> M {
        let assembler = Assembler([M.ModuleAssemblyType()], parent: modulesAssembler)
        return assembler.resolver.resolve(M.self, name: name)!
    }
    
}

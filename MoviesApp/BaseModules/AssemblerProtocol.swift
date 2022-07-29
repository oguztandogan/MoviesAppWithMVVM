//
//  AssemblerWireframeInteractorProtocol.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 12.07.2022.
//

import Foundation
import Swinject

protocol AssemblerProtocol {
    
}

extension AssemblerProtocol {
    
    func returnResolver() -> Resolver {
        return Assembler.sharedAssembler.resolver
    }
}

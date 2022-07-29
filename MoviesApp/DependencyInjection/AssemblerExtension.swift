//
//  AssemblerExtension.swift
//  Movee
//
//  Created by Oguz Tandogan on 13.12.2020.
//  Copyright © 2020 Oguz Tandogan. All rights reserved.
//

import Foundation
import Swinject

extension Assembler {
    static let sharedAssembler: Assembler = {
        let container = Container()
        let assembler = Assembler([
            ClientSideAssembly(),
            ManagerAssembly(),
            ApiRemoteAssembly(),
            RepositoryAssembly(),
            UsecaseAssembly(),
            ApiProviderServiceAssembly()], container: container)
        return assembler
    }()
}

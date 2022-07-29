//
//  ManagerAssembly.swift
//  Movee
//
//  Created by Oguz Tandogan on 13.12.2020.
//  Copyright © 2020 Oguz Tandogan. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class ManagerAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(HttpClientInterface.self, initializer: ApiManager.init).inObjectScope(.container)
    }
}

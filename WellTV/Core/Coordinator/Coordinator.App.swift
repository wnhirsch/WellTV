//
//  Coordinator.App.swift
//  WellTV
//
//  Created by Wellington Nascente Hirsch on 16/05/22.
//

import UIKit

extension Coordinator {
    
    class App {

        private let window: UIWindow
        private(set) var childCoordinator: CoordinatorProtocol?

        init(window: UIWindow) {
            self.window = window
        }

        func start() {
            let showCoordinator = Coordinator.Show()
            showCoordinator.start()
            childCoordinator = showCoordinator
            window.rootViewController = showCoordinator.containerViewController
            window.makeKeyAndVisible()
        }

    }
    
}

//
//  Coordinator.Show.swift
//  WellTV
//
//  Created by Wellington Nascente Hirsch on 16/05/22.
//

import UIKit

extension Coordinator {
    
    class Show: CoordinatorProtocol {

        var childCoordinator: CoordinatorProtocol?
        weak var childDelegate: ChildCoordinatorDelegate?

        var containerViewController: UIViewController {
            return navigationController
        }
        
        private let navigationController = UINavigationController()
        
        func start() {
            let vc = Scene.Show.List.ViewController(viewModel: .init(coordinator: self, worker: .init()))
            navigationController.pushViewController(vc, animated: false)
        }
    }
    
}

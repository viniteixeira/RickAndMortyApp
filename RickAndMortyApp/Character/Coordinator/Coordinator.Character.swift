//
//  Coordinator.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 29/11/21.
//

import Foundation
import UIKit

extension Coordinator {

    class Character: CoordinatorProtocol {

        // MARK: Properties
        var childCoordinators = [Coordinator]()
        var navController: UINavigationController

        init(navController: UINavigationController) {
            self.navController = navController
        }

        // MARK: CoordinatorProtocol
        func start() {
            let worker = Worker.Character(repository: .init(), coordinator: self)
            let viewModel = ViewModel.Character(worker: worker)
            let listController = Scene.Character.ListViewController(viewModel: viewModel)
            navController.viewControllers.append(listController)
        }
    }
}

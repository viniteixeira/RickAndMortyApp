//
//  Coordinator.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 29/11/21.
//

import Foundation
import UIKit

protocol CoordinatorCharacterProtocol {
    func instatiate()
    func sendToCharacterController(_ character: Model.Character)
}

extension Coordinator {

    class Character: CoordinatorProtocol, CoordinatorCharacterProtocol {

        // MARK: Properties
        var childCoordinators = [Coordinator]()
        var navController: UINavigationController

        // MARK: Initializers
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

        // MARK: CoordinatorCharacterProtocol
        func instatiate() {
            start()
        }
        
        func sendToCharacterController(_ character: Model.Character) {
            let controller = Scene.Character.ViewController(character: character)
            navController.pushViewController(controller, animated: true)
        }
    }
}

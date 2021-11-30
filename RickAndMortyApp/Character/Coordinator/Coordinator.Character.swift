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
    func sendToCharacterController(_ character: Model.Character, viewModel: ViewModel.Character)
    func sendToEpisodeController(_ episode: Model.Episode)
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
            navController.pushViewController(listController, animated: true)
        }

        // MARK: CoordinatorCharacterProtocol
        func instatiate() {
            start()
        }
        
        func sendToCharacterController(_ character: Model.Character, viewModel: ViewModel.Character) {
            let controller = Scene.Character.ViewController(character: character, viewModel: viewModel)
            navController.pushViewController(controller, animated: true)
        }

        func sendToEpisodeController(_ episode: Model.Episode) {
            var coordinator: CoordinatorEpisodeProtocol = Coordinator.Episode(navController: navController)
            coordinator.episode = episode
            coordinator.instantiate()
        }
    }
}

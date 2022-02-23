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
    func sendToCharacter(_ character: Model.Character, viewModel: ViewModel.Character)
    func sendToEpisode(_ episode: Model.Episode)
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

        // MARK: Methods
        private func startWithSwiftUI() {}

        #if RickAndMortyApp
        private func startWithCodeView(_ viewModel: ViewModel.Character) {
            let listController = Scenes.Character.ListViewController(viewModel: viewModel)
            navController.pushViewController(listController, animated: true)
        }

        private func sendToCharacterController(_ character: Model.Character, viewModel: ViewModel.Character) {
            let controller = Scenes.Character.ViewController(character: character, viewModel: viewModel)
            navController.pushViewController(controller, animated: true)
        }

        #endif

        // MARK: CoordinatorProtocol
        func start() {
            let worker = Worker.Character(repository: .init(), coordinator: self)
            let viewModel = ViewModel.Character(worker: worker)
            #if RickAndMortyApp
            startWithCodeView(viewModel)
            #endif
        }

        // MARK: CoordinatorCharacterProtocol
        func instatiate() {
            start()
        }

        func sendToCharacter(_ character: Model.Character, viewModel: ViewModel.Character) {
            #if RickAndMortyApp
            sendToCharacterController(character, viewModel: viewModel)
            #endif
        }

        func sendToEpisode(_ episode: Model.Episode) {
//            var coordinator: CoordinatorEpisodeProtocol = Coordinator.Episode(navController: navController)
//            coordinator.episode = episode
//            coordinator.instantiate()
        }
    }
}

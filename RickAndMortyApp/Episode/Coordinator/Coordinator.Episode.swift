//
//  Coordinator.Episode.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 30/11/21.
//

import Foundation
import UIKit

protocol CoordinatorEpisodeProtocol {
    func instantiate()
    var episode: Model.Episode { get set }
}

extension Coordinator {

    class Episode: CoordinatorProtocol, CoordinatorEpisodeProtocol {

        // MARK: Properties
        var episode: Model.Episode
        var childCoordinators = [Coordinator]()
        var navController: UINavigationController

        // MARK: Initializers
        init(navController: UINavigationController) {
            self.navController = navController
            self.episode = .init(id: 0, name: "", episode: "")
        }

        // MARK: CoordinatorProtocol
        func start() {
            let worker = Worker.Episode(repository: .init(), coordinator: self)
            let viewModel = ViewModel.Episode(worker: worker, episode: episode)
            let controller = Scene.Episode.ViewController(viewModel: viewModel)
            navController.pushViewController(controller, animated: true)
        }

        // MARK: CoordinatorEpisodeProtocol
        func instantiate() {
            start()
        }
    }
}

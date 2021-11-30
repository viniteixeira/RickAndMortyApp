//
//  Coordinator.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 29/11/21.
//

import UIKit

enum Coordinator {}

protocol CoordinatorProtocol {
    var childCoordinators: [Coordinator] { get set }
    var navController: UINavigationController { get set }
    func start()
}

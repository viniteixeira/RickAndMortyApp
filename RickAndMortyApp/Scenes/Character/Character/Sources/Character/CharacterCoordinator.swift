import Core
import UIKit
import Episode

// MARK: - CharacterCoordinatorProtocol
public protocol CharacterCoordinatorProtocol {
    func instatiate()
    func sendToCharacterDetail(_ character: Character, episodes: [Episode])
}

// MARK: - CharacterCoordinator
public class CharacterCoordinator {
    
    // MARK: Properties
    public var childCoordinators: [CoordinatorProtocol] = [CoordinatorProtocol]()
    public var navController: UINavigationController
    
    // MARK: Inits
    public init(navController: UINavigationController) {
        self.navController = navController
    }
}

// MARK: - CoordinatorProtocol
extension CharacterCoordinator: CoordinatorProtocol {
    public func start() {
        let worker: CharacterWorkerProtocol = CharacterWorker(coordinator: self)
        let viewModel: CharacterListViewModelProtocol = CharacterListViewModel(worker: worker)
        let viewController: CharacterListViewController = .init(viewModel: viewModel)
        navController.pushViewController(viewController, animated: true)
    }
}

// MARK: - CharacterCoordinator+CharacterCoordinatorProtocol
extension CharacterCoordinator: CharacterCoordinatorProtocol {
    public func instatiate() {
        start()
    }
    
    public func sendToCharacterDetail(_ character: Character, episodes: [Episode]) {
        let viewModel: CharacterDetailViewModelProtocol = CharacterDetailViewModel(character: character, episodes: episodes)
        let viewController: CharacterDetailViewController = .init(viewModel: viewModel)
        navController.pushViewController(viewController, animated: true)
    }
}

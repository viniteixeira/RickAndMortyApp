import Core
import UIKit

public class CharacterCoordinator {
    
    // MARK: Properties
    var childCoordinators: [CoordinatorProtocol] = [CoordinatorProtocol]()
    var navController: UINavigationController
    
    // MARK: Initializers
    init(navController: UINavigationController) {
        self.navController = navController
    }
}

public extension CharacterCoordinator: CoordinatorProtocol {
    public func start() {
        
    }
}

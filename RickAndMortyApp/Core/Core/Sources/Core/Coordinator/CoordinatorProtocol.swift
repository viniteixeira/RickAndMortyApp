import UIKit

public protocol CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] { get set }
    var navController: UINavigationController { get set }
    func start()
}

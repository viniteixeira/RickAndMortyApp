import UIKit

class CharacterListViewController: UIViewController {

    // MARK: Components
//    lazy var mainView = ListView(viewModel: viewModel)

    // MARK: Properties
    private var viewModel: ViewModel.Character

    // MARK: Initializers
    init(viewModel: ViewModel.Character) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View Lifecycle
    override func loadView() {
        super.loadView()

        view = mainView
    }

    // MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Characters"
        setupBind()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.state.value = .loadingData
    }

    // MARK: Methods
    private func setupBind() {
        viewModel.state.bind { state in
            switch state {
            case .loadingData:
                self.viewModel.fetchCharacters()
            case .loadedData:
                self.mainView.reloadData()
            }
        }
    }
}

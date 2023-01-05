import UIKit
import Core

class CharacterListViewController: UIViewController {

    // MARK: Components
    lazy var mainView: CharacterListMainView = .init()
    
    // MARK: Private Properties
    private var viewModel: CharacterListViewModelProtocol
    
    // MARK: Initializers
    init(viewModel: CharacterListViewModelProtocol) {
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
}

// MARK: - Private Methods
private extension CharacterListViewController {
    func setupBind() {
        setupMainView()
        viewModel.state.bind { state in
            switch state {
            case .loadingData:
                self.viewModel.fetchCharacters()
            case .loadedData:
                self.mainView.reloadData()
            }
        }
    }
    
    func setupMainView() {
        mainView.setupTableView(dataSource: self, delegate: self)
    }
}

// MARK: - UITableViewDataSource
extension CharacterListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterListTableViewCell.identifier, for: indexPath) as! CharacterListTableViewCell
        let viewModel: CharacterListTableViewCellViewModel = .init(character: viewModel.characters[indexPath.row])
        viewModel.setupCell(cell)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CharacterListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.didSelect(viewModel.characters[indexPath.row])
    }
}

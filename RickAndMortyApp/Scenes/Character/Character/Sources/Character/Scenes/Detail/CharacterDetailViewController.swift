import UIKit
import Episode

class CharacterDetailViewController: UIViewController {

    // MARK: Components
    lazy var mainView: CharacterDetailMainView = .init()
    
    // MARK: Private Properties
    private var viewModel: CharacterDetailViewModelProtocol

    // MARK: Inits
    init(viewModel: CharacterDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // MARK: View LifeCycle
    override func loadView() {
        super.loadView()

        view = mainView
    }

    // MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
    }
}

// MARK: - Private Methods
private extension CharacterDetailViewController {
    func setupMainView() {
        mainView.setupTableView(dataSource: self, delegate: self)
        mainView.updateView(viewModel.character)
    }
}

// MARK: - UITableViewDataSource
extension CharacterDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.character.episode.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterDetailTableViewCell.identifier, for: indexPath) as! CharacterDetailTableViewCell
        let episode: Episode = viewModel.episodes[indexPath.row]
        let viewModel: CharacterDetailTableViewCellViewModel = .init(episode: episode.episode, name: episode.name)
        viewModel.setupCell(cell)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CharacterDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

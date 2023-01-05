import UIKit
import CoreUI

class CharacterListMainView: UIView {

    // MARK: Components
    private let tableView: UITableView = {
        let tableView: UITableView = .init()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: Inits
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - CodeView
extension CharacterListMainView: CodeView {
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupConfigs() {
        backgroundColor = UIColor(named: "PrimaryColor")

        tableView.backgroundColor = .clear
        tableView.register(CharacterListTableViewCell.self, forCellReuseIdentifier: CharacterListTableViewCell.identifier)
    }
}

// MARK: - Internal Methods
extension CharacterListMainView {
    func reloadData() {
        tableView.reloadData()
    }
    
    func setupTableView(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }
}

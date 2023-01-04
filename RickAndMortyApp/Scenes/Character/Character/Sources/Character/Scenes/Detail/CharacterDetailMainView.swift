import UIKit
import CoreUI

class CharacterDetailMainView: UIView {
    
    // MARK: Components
    private let contentStackView: UIStackView = {
        let sv: UIStackView = .init()
        sv.axis = .vertical
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.isLayoutMarginsRelativeArrangement = true
        sv.layoutMargins = .init(top: 16, left: 16, bottom: 16, right: 16)
        return sv
    }()

    private let headerStackView: UIStackView = .init()
    private let charImageView: UIImageView = {
        let iv: UIImageView = UIImageView()
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 8
        return iv
    }()

    private let infoStackView: UIStackView = {
        let sv: UIStackView = UIStackView()
        sv.spacing = 8
        sv.axis = .vertical
        sv.layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
        sv.isLayoutMarginsRelativeArrangement = true
        return sv
    }()

    private let nameLabel: UILabel = {
        let lb: UILabel = UILabel()
        lb.textColor = .white
        lb.font = .boldSystemFont(ofSize: 22)
        lb.numberOfLines = 0
        return lb
    }()

    private let statusLabel: UILabel = {
        let lb: UILabel = UILabel()
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 19)
        lb.numberOfLines = 0
        return lb
    }()

    private let locationDescriptionLabel: UILabel = {
        let lb: UILabel = UILabel()
        lb.font = .systemFont(ofSize: 19)
        lb.textColor = .lightGray
        lb.numberOfLines = 0
        lb.text = "Last known location:"
        return lb
    }()

    private let locationLabel: UILabel = {
        let lb: UILabel = UILabel()
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 20)
        lb.numberOfLines = 0
        return lb
    }()

    private let firstSeenDescriptionLabel: UILabel = {
        let lb: UILabel = UILabel()
        lb.font = .systemFont(ofSize: 19)
        lb.textColor = .lightGray
        lb.text = "First seen in:"
        lb.numberOfLines = 0
        return lb
    }()

    private let firstSeenLabel: UILabel = {
        let lb: UILabel = UILabel()
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 20)
        lb.numberOfLines = 0
        return lb
    }()

    private let episodeDescriptionLabel: UILabel = {
        let lb: UILabel = UILabel()
        lb.text = "Episodes"
        lb.textColor = .white
        lb.font = .boldSystemFont(ofSize: 22)
        lb.numberOfLines = 0
        return lb
    }()

    private let tableView = UITableView()

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
extension CharacterDetailMainView: CodeView {
    func buildViewHierarchy() {
        infoStackView.addArrangedSubview(nameLabel)
        infoStackView.addArrangedSubview(statusLabel)
        infoStackView.addArrangedSubview(locationDescriptionLabel)
        infoStackView.addArrangedSubview(locationLabel)
        infoStackView.addArrangedSubview(firstSeenDescriptionLabel)
        infoStackView.addArrangedSubview(firstSeenLabel)
        infoStackView.addArrangedSubview(UIView())

        headerStackView.addArrangedSubview(charImageView)
        headerStackView.addArrangedSubview(infoStackView)

        contentStackView.addArrangedSubview(headerStackView)
        contentStackView.setCustomSpacing(16, after: headerStackView)
        contentStackView.addArrangedSubview(episodeDescriptionLabel)
        contentStackView.setCustomSpacing(8, after: episodeDescriptionLabel)
        contentStackView.addArrangedSubview(tableView)
        addSubview(contentStackView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            charImageView.widthAnchor.constraint(equalToConstant: 190),
            charImageView.heightAnchor.constraint(equalToConstant: 190)
        ])
    }

    func setupConfigs() {
        backgroundColor = UIColor(named: "PrimaryColor")
        tableView.register(CharacterDetailTableViewCell.self, forCellReuseIdentifier: CharacterDetailTableViewCell.identifier)
        tableView.backgroundColor = .clear
    }
}

// MARK: - Internal Methods
extension CharacterDetailMainView {
    func updateView(_ character: Character) {
        nameLabel.text = character.name
        let status = "\(character.status) - \(character.species)"
        statusLabel.text = status
        locationLabel.text = character.location.name
        firstSeenLabel.text = character.origin.name
        if let url = URL(string: character.image) {
            charImageView.load(url: url)
        }
        tableView.reloadData()
    }
    
    func setupTableView(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }
}

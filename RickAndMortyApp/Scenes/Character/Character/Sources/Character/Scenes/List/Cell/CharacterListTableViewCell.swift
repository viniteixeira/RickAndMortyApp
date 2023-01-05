import UIKit
import CoreUI

class CharacterListTableViewCell: UITableViewCell {
    
    // MARK: Components
    private let contentStackView: UIStackView = {
        let sv: UIStackView = .init()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.clipsToBounds = true
        return sv
    }()
    
    private let roundedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.backgroundColor = UIColor(named: "CellColor")
        return view
    }()
    
    private let charImageView: UIImageView = .init()
    
    private let infoStackView: UIStackView = {
        let sv: UIStackView = .init()
        sv.spacing = 8
        sv.axis = .vertical
        sv.layoutMargins = .init(top: 8, left: 16, bottom: 8, right: 16)
        sv.isLayoutMarginsRelativeArrangement = true
        return sv
    }()
    
    private let nameLabel: UILabel = {
        let lb: UILabel = .init()
        lb.textColor = .white
        lb.font = .boldSystemFont(ofSize: 16)
        return lb
    }()
    
    private let statusLabel: UILabel = {
        let lb: UILabel = .init()
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 13)
        return lb
    }()
    
    private let locationDescriptionLabel: UILabel = {
        let lb: UILabel = .init()
        lb.font = .systemFont(ofSize: 13)
        lb.textColor = .lightGray
        lb.text = "Last known location:"
        return lb
    }()
    
    private let locationLabel: UILabel = {
        let lb: UILabel = .init()
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 14)
        return lb
    }()
       
    private let firstSeenDescriptionLabel: UILabel = {
        let lb: UILabel = .init()
        lb.font = .systemFont(ofSize: 13)
        lb.textColor = .lightGray
        lb.text = "First seen in:"
        return lb
    }()
    
    private let firstSeenLabel: UILabel = {
        let lb: UILabel = .init()
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 14)
        return lb
    }()
    
    // MARK: Properties
    static var identifier: String = "CharacterListTableViewCell"
    
    // MARK: Inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - CodeView
extension CharacterListTableViewCell: CodeView {
    
    func buildViewHierarchy() {
        infoStackView.addArrangedSubview(nameLabel)
        infoStackView.addArrangedSubview(statusLabel)
        infoStackView.addArrangedSubview(locationDescriptionLabel)
        infoStackView.addArrangedSubview(locationLabel)
        infoStackView.addArrangedSubview(firstSeenDescriptionLabel)
        infoStackView.addArrangedSubview(firstSeenLabel)

        contentStackView.addArrangedSubview(charImageView)
        contentStackView.addArrangedSubview(infoStackView)

        roundedView.addSubview(contentStackView)
        contentView.addSubview(roundedView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            roundedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            roundedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            roundedView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            roundedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            contentStackView.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor),
            contentStackView.topAnchor.constraint(equalTo: roundedView.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: roundedView.bottomAnchor),

            charImageView.widthAnchor.constraint(equalToConstant: 156),
            charImageView.heightAnchor.constraint(equalToConstant: 156)
        ])
    }

    func setupConfigs() {
        backgroundColor = .clear
        charImageView.translatesAutoresizingMaskIntoConstraints = false
        charImageView.layer.cornerRadius = 8
        charImageView.clipsToBounds = true
    }
}

// MARK: - Internal Methods
extension CharacterListTableViewCell {
    func updateCell(_ character: Character) {
        nameLabel.text = character.name
        let status = "\(character.status) - \(character.species)"
        statusLabel.text = status
        locationLabel.text = character.location.name
        firstSeenLabel.text = character.origin.name
        if let url = URL(string: character.image) {
            charImageView.load(url: url)
        }
    }
}

import UIKit
import CoreUI

class CharacterDetailTableViewCell: UITableViewCell {
    
    // MARK: Components
    private let contentStackView: UIStackView = {
        let sv: UIStackView = UIStackView()
        sv.axis = .vertical
        sv.spacing = 8
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.isLayoutMarginsRelativeArrangement = true
        sv.layoutMargins = .init(top: 8, left: 16, bottom: 0, right: 16)
        return sv
    }()

    private let nameLabel: UILabel = {
        let lb: UILabel = UILabel()
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 16)
        return lb
    }()

    private let separatorView = UIView()
    
    // MARK: Properties
    static var identifier: String = "CharacterDetailTableViewCell"
    
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
extension CharacterDetailTableViewCell: CodeView {
    func buildViewHierarchy() {
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(separatorView)

        addSubview(contentStackView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentStackView.topAnchor.constraint(equalTo: topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor),

            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    func setupConfigs() {
        backgroundColor = .clear
        separatorView.backgroundColor = .white
    }
}

// MARK: - Internal Methods
extension CharacterDetailTableViewCell {
    func updateCell(episode: String, name: String) {
        let name = "\(episode) - \(name)"
        nameLabel.text = name
    }
}


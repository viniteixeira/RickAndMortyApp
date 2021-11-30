//
//  Scene.Character.View.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 29/11/21.
//

import UIKit
import VTCodeView

protocol SceneCharacterViewDelegate {
    func selected(_ episode: Model.Episode)
}

extension Scene.Character {

    class View: UIView, CodeView {

        // MARK: Components
        private let contentStackView: UIStackView = {
            let sv = UIStackView()
            sv.axis = .vertical
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.isLayoutMarginsRelativeArrangement = true
            sv.layoutMargins = .init(top: 16, left: 16, bottom: 16, right: 16)
            return sv
        }()

        private let headerStackView = UIStackView()

        private let charImageView: UIImageView = {
            let iv = UIImageView()
            iv.clipsToBounds = true
            iv.layer.cornerRadius = 8
            return iv
        }()

        private let infoStackView: UIStackView = {
            let sv = UIStackView()
            sv.spacing = 8
            sv.axis = .vertical
            sv.layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
            sv.isLayoutMarginsRelativeArrangement = true
            return sv
        }()

        private let nameLabel: UILabel = {
            let lb = UILabel()
            lb.textColor = .white
            lb.font = .boldSystemFont(ofSize: 22)
            lb.numberOfLines = 0
            return lb
        }()

        private let statusLabel: UILabel = {
            let lb = UILabel()
            lb.textColor = .white
            lb.font = .systemFont(ofSize: 19)
            lb.numberOfLines = 0
            return lb
        }()

        private let locationDescriptionLabel: UILabel = {
            let lb = UILabel()
            lb.font = .systemFont(ofSize: 19)
            lb.textColor = .lightGray
            lb.text = "Last known location:"
            return lb
        }()

        private let locationLabel: UILabel = {
            let lb = UILabel()
            lb.textColor = .white
            lb.font = .systemFont(ofSize: 20)
            lb.numberOfLines = 0
            return lb
        }()

        private let firstSeenDescriptionLabel: UILabel = {
            let lb = UILabel()
            lb.font = .systemFont(ofSize: 19)
            lb.textColor = .lightGray
            lb.text = "First seen in:"
            return lb
        }()

        private let firstSeenLabel: UILabel = {
            let lb = UILabel()
            lb.textColor = .white
            lb.font = .systemFont(ofSize: 20)
            lb.numberOfLines = 0
            return lb
        }()

        private let episodeDescriptionLabel: UILabel = {
            let lb = UILabel()
            lb.text = "Episodes"
            lb.textColor = .white
            lb.font = .boldSystemFont(ofSize: 22)
            lb.numberOfLines = 0
            return lb
        }()

        private let tableView = UITableView()

        // MARK: Properties
        private var character: Model.Character
        var delegate: SceneCharacterViewDelegate?

        // MARK: Initializers
        init(character: Model.Character) {
            self.character = character
            super.init(frame: .zero)
            setupView()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        // MARK: Methods
        private func updateView() {
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

        // MARK: CodeView
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

        func setupAdditionalConfiguration() {
            backgroundColor = UIColor(named: "PrimaryColor")

            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(Cell.self, forCellReuseIdentifier: "Cell")
            tableView.backgroundColor = .clear
            updateView()
        }
    }
}

// MARK: - UITableViewDataSource
extension Scene.Character.View: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return character.episodes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        cell.episode = character.episodes[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate
extension Scene.Character.View: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.selected(character.episodes[indexPath.row])
    }
}

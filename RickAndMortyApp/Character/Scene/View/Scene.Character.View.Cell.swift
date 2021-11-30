//
//  Scene.Character.View.Cell.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 30/11/21.
//

import UIKit
import VTCodeView

extension Scene.Character.View {

    class Cell: UITableViewCell, CodeView {

        // MARK: Components
        private let contentStackView: UIStackView = {
            let sv = UIStackView()
            sv.axis = .vertical
            sv.spacing = 8
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.isLayoutMarginsRelativeArrangement = true
            sv.layoutMargins = .init(top: 8, left: 16, bottom: 0, right: 16)
            return sv
        }()

        private let nameLabel: UILabel = {
            let lb = UILabel()
            lb.textColor = .white
            lb.font = .systemFont(ofSize: 16)
            return lb
        }()

        private let separatorView = UIView()

        // MARK: Properties
        var episode: Model.Episode? {
            didSet { updateCell() }
        }

        // MARK: Initializers
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)

            setupView()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        // MARK: Methods
        private func updateCell() {
            let name = "\(episode?.episode ?? "") - \(episode?.name ?? "")"
            nameLabel.text = name
        }

        // MARK: CodeView
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

        func setupAdditionalConfiguration() {
            backgroundColor = .clear
            separatorView.backgroundColor = .white
        }
    }
}

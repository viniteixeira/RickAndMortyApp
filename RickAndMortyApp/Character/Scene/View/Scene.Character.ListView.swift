//
//  Scene.Character.ListView.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 29/11/21.
//

import UIKit
import VTCodeView

extension Scene.Character {

    class ListView: UIView, CodeView {

        // MARK: Components
        private let tableView = UITableView()

        // MARK: Initializers
        init() {
            super.init(frame: .zero)
            setupView()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        // MARK: CodeView
        func buildViewHierarchy() {
            addSubview(tableView)
        }

        func setupConstraints() {
            NSLayoutConstraint.activate([
                tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
                tableView.topAnchor.constraint(equalTo: topAnchor),
                tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }

        func setupAdditionalConfiguration() {
            <#code#>
        }
    }
}

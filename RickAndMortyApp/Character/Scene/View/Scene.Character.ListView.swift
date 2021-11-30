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

        // MARK: Properties
        private var viewModel: ViewModel.Character

        // MARK: Initializers
        init(viewModel: ViewModel.Character) {
            self.viewModel = viewModel
            super.init(frame: .zero)
            setupView()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        // MARK: Methods
        func reloadData() {
            tableView.reloadData()
        }

        // MARK: CodeView
        func buildViewHierarchy() {
            addSubview(tableView)
        }

        func setupConstraints() {
            tableView.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
                tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ])
        }

        func setupAdditionalConfiguration() {
            backgroundColor = UIColor(named: "PrimaryColor")

            tableView.backgroundColor = .clear
            tableView.dataSource = self
            tableView.register(Cell.self, forCellReuseIdentifier: "Cell")
        }
    }
}

// MARK: - UITableViewDataSource
extension Scene.Character.ListView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        cell.character = viewModel.characters[indexPath.row]
        return cell
    }
}

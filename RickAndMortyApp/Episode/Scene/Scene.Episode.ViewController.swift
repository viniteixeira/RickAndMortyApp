//
//  Scene.Episode.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 30/11/21.
//

import UIKit

extension Scene {

    enum Episode {}

}

extension Scene.Episode {

    class ViewController: UIViewController {

        // MARK: Properties
        private let viewModel: ViewModel.Episode

        // MARK: Initializers
        init(viewModel: ViewModel.Episode) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        // MARK: View LifeCycle
        override func loadView() {
            super.loadView()
        }

        // MARK: UIViewController
        override func viewDidLoad() {
            super.viewDidLoad()
            setupBinds()
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            viewModel.state.value = .loadingData
        }

        // MARK: Methods
        private func setupBinds() {
            viewModel.state.bind { state in
                switch state {
                case .loadingData:
                    self.viewModel.fetchEpisode()
                case .loadedData:
                    ()
                }
            }
        }
    }
}

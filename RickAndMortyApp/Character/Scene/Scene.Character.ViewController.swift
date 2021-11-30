//
//  Character.ViewController.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 12/11/21.
//

import UIKit

extension Scene {

    enum Character {}

}

extension Scene.Character {

    class ViewController: UIViewController {

        // MARK: Components
        lazy var mainView = View(character: character)
        private var character: Model.Character
        private var viewModel: ViewModel.Character

        // MARK: Initializers
        init(character: Model.Character, viewModel: ViewModel.Character) {
            self.character = character
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

            mainView.delegate = self
        }
    }
}

extension Scene.Character.ViewController: SceneCharacterViewDelegate {
    func selected(_ episode: Model.Episode) {
        viewModel.sendToEpisodeView(episode)
    }
}

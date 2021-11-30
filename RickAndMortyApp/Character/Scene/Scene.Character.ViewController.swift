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

        // MARK: Initializers
        init(character: Model.Character) {
            self.character = character
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
    }
}

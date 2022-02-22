//
//  Scene.Character.ListViewSwiftUI.swift
//  RickAndMortyAppSwiftUI
//
//  Created by Vinicius Teixeira on 22/02/22.
//

import SwiftUI

extension Scenes.Character.SwiftUI {

    struct ListView: View {

        // MARK: Properties
        var characters: [Model.Character]

        // MARK: Body
        var body: some View {
            NavigationView {
//                List(characters) { character in
//
//
//                }
//                .navigationTitle("Characters")
            }
        }
    }
}

struct CharacterListViewPreviews: PreviewProvider {
    static var previews: some View {
        Scenes.Character.SwiftUI.ListView(characters: Mock.getCharacters())
    }
}

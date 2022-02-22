//
//  Scene.Character.SwiftUI.Cell.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 22/02/22.
//

import SwiftUI

extension Scenes.Character.SwiftUI {

    struct Cell: View {

        var character: Model.C

        var body: some View {
            HStack {
                Text("Hello, World!")
                Text("2")
            }
        }
    }
}

struct CharacterCellPreviews: PreviewProvider {
    static var previews: some View {
        Scenes.Character.SwiftUI.Cell()
    }
}

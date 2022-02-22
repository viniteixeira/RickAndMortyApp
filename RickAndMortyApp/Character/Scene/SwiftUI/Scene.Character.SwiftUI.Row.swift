//
//  Scene.Character.SwiftUI.Row.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 22/02/22.
//

import SwiftUI

extension Scenes.Character.SwiftUI {

    struct Row: View {

        var character: Model.Character

        var body: some View {
            HStack {
                Text("Hello, World!")
                Text("2")
            }
        }
    }
}

//struct CharacterCellPreviews: PreviewProvider {
//    static var previews: some View {
//        Scenes.Character.SwiftUI.Row()
//    }
//}

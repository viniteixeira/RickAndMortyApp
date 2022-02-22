//
//  Scene.Character.SwiftUI.Row.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 22/02/22.
//

import SwiftUI

extension Scenes.Character.SwiftUI {

    struct Row: View {

        // MARK: Properties
        var character: Model.Character
        @ObservedObject var imageLoader = ImageLoader()
        @State var image = UIImage()

        // MARK: Initializers
        init(character: Model.Character) {
            self.character = character
        }

        // MARK: Body
        var body: some View {
            HStack {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 156, height: 156)
                    .aspectRatio(contentMode: .fit)
                    .onReceive(imageLoader.$image) { image in
                        self.image = image
                    }
                    .onAppear { imageLoader.loadImage(for: character.image) }

                VStack(alignment: .leading, spacing: 8) {
                    Text(character.name)
                        .foregroundColor(Color.white)
                        .font(.system(size: 16))
                        .bold()

                    Text(character.status)
                        .foregroundColor(Color.white)
                        .font(.system(size: 13))

                    Text("Last known location:")
                        .foregroundColor(Color(uiColor: .lightGray))
                        .font(.system(size: 13))

                    Text(character.location.name)
                        .foregroundColor(Color.white)
                        .font(.system(size: 14))

                    Text("First seen in:")
                        .foregroundColor(Color(uiColor: .lightGray))
                        .font(.system(size: 13))

                    Text(character.origin.name)
                        .foregroundColor(Color.white)
                        .font(.system(size: 14))

                    Spacer()
                }
                .padding(.init(top: 8, leading: 16, bottom: -8, trailing: 16))

                Spacer()

            }.ignoresSafeArea()
                .cornerRadius(8)
                .background(Color(UIColor(named: "CellColor")!))
        }
    }
}

struct CharacterCellPreviews: PreviewProvider {
    static var previews: some View {
        Scenes.Character.SwiftUI.Row(character: Mock.getCharacter(index: 0))
            .previewLayout(.fixed(width: 428, height: 156))
    }
}

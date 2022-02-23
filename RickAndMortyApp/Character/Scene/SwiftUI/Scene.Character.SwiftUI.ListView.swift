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
            ZStack {
                Color(uiColor: UIColor(named: "PrimaryColor")!)
                    .ignoresSafeArea()
                NavigationView {
                    List(characters, id: \.id) { character in
                        Scenes.Character.SwiftUI.Row(character: character)
                            .frame(width: UIScreen.main.bounds.width-16, height: 156)
                            .listRowInsets(.init(top: 0, leading: 8, bottom: 8, trailing: 8))
                            .cornerRadius(8)
                            .listRowBackground(Color.clear)
                    }.listStyle(PlainListStyle())

                    .navigationTitle("Characters")
                    .navigationBarTitleDisplayMode(.inline)
                    .background(Color(uiColor: .init(named: "PrimaryColor")!))

                }
                .onAppear { self.setNavigationBarAppearance() }
            }
        }

        private func setNavigationBarAppearance(){
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor.white]
         }
    }
}

struct CharacterListViewPreviews: PreviewProvider {
    static var previews: some View {
        Scenes.Character.SwiftUI.ListView(characters: Mock.getCharacters())
    }
}

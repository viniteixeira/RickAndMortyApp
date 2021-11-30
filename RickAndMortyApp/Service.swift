//
//  Services.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 29/11/21.
//

import Foundation

class Service {

    // MARK: Properties
    public static var baseURL: String {
        get { getURLPlist() }
    }

    // MARK: Methods
    private static func getURLPlist() -> String {
        var urlString: String = ""
        if let path = Bundle.main.path(forResource: "Services", ofType: "plist") {
            let dictionary = NSDictionary(contentsOfFile: path)
            urlString = (dictionary?.value(forKey: "url") as? String) ?? ""
         }
        return urlString
    }
}

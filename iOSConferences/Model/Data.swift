//
// Created by Abel Fernandez Pineiro on 11/10/2020.
// Copyright (c) 2020 daferpi. All rights reserved.
//

import Foundation

func loadFile<T: Decodable>(_ filename: String ) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("cannot find \(filename)")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Cannot load \(filename): \n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        let format = DateFormatter()
        format.dateFormat = "yyyy-mm-dd"
        decoder.dateDecodingStrategy = .formatted(format)
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Cannot parse \(filename): \(T.self):\n\(error)")
    }
}

let conferencesData: [Conference] = loadFile("conferencesData.json")
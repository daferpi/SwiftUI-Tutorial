//
// Created by Abel Fernandez Pineiro on 12/10/2020.
// Copyright (c) 2020 daferpi. All rights reserved.
//

import Foundation
import Combine
import Yams

let url = URL(string: "https://raw.githubusercontent.com/Lascorbe/CocoaConferences/master/_data/conferences.yml")

public class ConferenceLoader: ObservableObject {
    @Published var conferences = [Conference]()
    var result: AnyCancellable?

    public init() {
        loadConferences { conferences in
            self.conferences = conferences
        }
    }

    func loadConferences(completion: @escaping ([Conference]) -> Void) {
        result = URLSession.shared.dataTaskPublisher(for: url!)
            .decode(type: [Conference].self, decoder: YAMLDecoder())
            .receive(on: RunLoop.main).eraseToAnyPublisher()
            .sink(receiveCompletion: { complete in
                switch complete {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }, receiveValue: { conferences in
                completion(conferences)
            })
    }
}

extension Publisher where Output == URLSession.DataTaskPublisher.Output {
    public func decode<Item, Coder>(type: Item.Type, decoder: Coder) -> Publishers.TryMap<Self, Item> where Item: Decodable, Coder: TopLevelDecoder, Coder.Input == Data {
        return tryMap { try decoder.decode(type, from: $0.data) }
    }
}
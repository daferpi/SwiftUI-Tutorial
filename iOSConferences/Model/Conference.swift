//
// Created by Abel Fernandez Pineiro on 11/10/2020.
// Copyright (c) 2020 daferpi. All rights reserved.
//

import Foundation

class Conference: Codable, Identifiable {
    var name: String
    var location: String
    var start: Date
    var end: Date?
    var link: String
}

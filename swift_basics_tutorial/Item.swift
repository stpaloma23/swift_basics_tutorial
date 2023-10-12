//
//  Item.swift
//  swift_basics_tutorial
//
//  Created by Paloma St.Clair on 9/29/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

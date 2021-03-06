//
//  Rot13.swift
//  TextTransformer
//
//  Created by Cory Steers on 4/14/19.
//  Copyright © 2019 Cory Steers. All rights reserved.
//

import Foundation

struct ROT13 {
    private static var key = [Character: Character]()

    private static let uppercase = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    private static let lowercase = Array("abcdefghijklmnopqrstuvwxyz")

    static func string(_ string: String) -> String {
        if ROT13.key.isEmpty {
            for i in 0 ..< 26 {
                ROT13.key[ROT13.uppercase[i]] = ROT13.uppercase[(i + 13) % 26]
                ROT13.key[ROT13.lowercase[i]] = ROT13.lowercase[(i + 13) % 26]
            }
        }

        let transformed = string.map { ROT13.key[$0, default: $0] }
        return String(transformed)
    }
}

//
//  DefaultError.swift
//  Veryable Sample
//
//  Created by Valentyn Khimchuk on 17.12.2022.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import Foundation

enum DefaultError: LocalizedError {
    case wrongData
    case message(message: String)

    var errorDescription: String? {
        switch self {
        case .wrongData:
            return "Can't read data from JSON"
        case .message(message: let message):
            return message
        }
    }
}

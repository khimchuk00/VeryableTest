//
//  Account.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation

enum AccountType: String {
    case bank
    case card

    init(intValue: Int) {
        switch intValue {
        case 0:
            self = .bank
        default:
            self = .card
        }
    }

    var title: String {
        switch self {
        case .bank:
            return "Bank Accounts"
        case .card:
            return "Cards"
        }
    }
}

struct Account: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case accountType = "account_type"
        case accountName = "account_name"
        case description = "desc"
    }

    var id: Int
    var accountType: String
    var accountName: String
    var description: String

    var type: AccountType {
        AccountType(rawValue: accountType) ?? .bank
    }
}

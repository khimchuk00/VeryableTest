//
//  Account.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation

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
}

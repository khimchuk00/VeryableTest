//
//  NetworkManagerMock.swift
//  Veryable SampleTests
//
//  Created by Valentyn Khimchuk on 19.12.2022.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import Foundation
@testable import Veryable_Sample

class NetworkManagerMock: LoadDataProtocol {
    func getAccounts(banks: @escaping (Result<[Veryable_Sample.Account], Error>) -> Void) {
        banks(.success([Account(id: 12, accountType: "bank", accountName: "Chase", description: "My bank")]))
    }
}

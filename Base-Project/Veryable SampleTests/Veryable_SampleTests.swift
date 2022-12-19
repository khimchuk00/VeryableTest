//
//  Veryable_SampleTests.swift
//  Veryable SampleTests
//
//  Created by Valentyn Khimchuk on 19.12.2022.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import XCTest
@testable import Veryable_Sample

final class Veryable_SampleTests: XCTestCase {
    func test_networkManager_getAccount_isCorrect() {
        let networkManager = NetworkManagerMock()
        networkManager.getAccounts { result in
            switch result {
            case .success(let accounts):
                XCTAssertEqual(accounts.count, 1)

                if let account = accounts.first {
                    XCTAssertEqual(account.accountType, "bank")
                    XCTAssertEqual(account.accountName, "Chase")
                    XCTAssertEqual(account.description, "My bank")
                    XCTAssertEqual(account.type, AccountType.bank)
                }
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, "")
            }
        }
    }
}

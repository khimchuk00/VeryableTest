//
//  AccountListViewController.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import UIKit

class AccountListViewController: UIViewController, AlertPresentableVC {
    //MARK: Public API

    //MARK: Inits
    init() {
        super.init(nibName: nil, bundle: nil)

        title = "Accounts".uppercased()
    }

    required init?(coder: NSCoder) { nil }

    //MARK: Overrides
    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkManager().getAccounts { [weak self] response in
            switch response {
            case .success(let accounts):
                self?.convertAccountsData(accounts: accounts)
            case .failure(let failure):
                self?.presentAlert(text: "Something went wrong", description: failure.localizedDescription)
            }
        }
    }

    //MARK: Private members
    private func convertAccountsData(accounts: [Account]) {
        var dataSource: [AccountType: [Account]] = [:]
        for account in accounts {
           addData(dataSource: &dataSource, data: account)
        }

        customView.update(dataSource: dataSource)
    }

    private func addData(dataSource: inout [AccountType: [Account]], data: Account) {
        if dataSource[data.type] == nil {
            dataSource[data.type] = [data]
        } else {
            dataSource[data.type]?.append(data)
        }
    }

    //MARK: Lazy Loads
    private lazy var customView: AccountListView = {
        AccountListView(delegate: self)
    }()
}

extension AccountListViewController: AccountListDelegate {
    func openDetails(data: Account) {
        // TODO: - add navigation to details
    }
}

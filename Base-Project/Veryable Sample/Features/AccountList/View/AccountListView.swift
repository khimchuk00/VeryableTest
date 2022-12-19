//
//  AccountListView.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

protocol AccountListDelegate: AnyObject {
    func openDetails(data: Account)
}

class AccountListView: UIView {
    //MARK: Public API

    //MARK: Inits
    init(delegate: AccountListDelegate) {
        self.del = delegate
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) { nil }

    private func setup() {
        backgroundColor = ViewColor.background.color

        constraints()
    }

    private func constraints() {
        addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(self)
            $0.bottom.equalTo(self)
            $0.leading.equalTo(self)
            $0.trailing.equalTo(self)
        }
    }

    //MARK: Overrides

    // MARK: - Update
    func update(dataSource: [Account]) {
        self.dataSource = dataSource
        tableView.reloadData()
    }

    //MARK: Private members
    private weak var del: AccountListDelegate?
    private var dataSource: [Account] = []

    //MARK: Lazy Loads
    private lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, World!"
        label.textColor = VGrey.dark.color
        label.font = .vryAvenirNextDemiBold(16)
        addSubview(label)
        return label
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(for: AccountTableViewCell.self)

        return tableView
    }()
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension AccountListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.cell(for: AccountTableViewCell.self, for: indexPath)
        cell?.configure(account: dataSource[indexPath.row])

        return cell ?? UITableViewCell()
    }
}

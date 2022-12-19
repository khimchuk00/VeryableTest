//
//  AccountListView.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

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
    func update(dataSource: [AccountType: [Account]]) {
        self.dataSource = dataSource
        tableView.reloadData()
    }

    //MARK: Private members
    private weak var del: AccountListDelegate?
    private var dataSource: [AccountType: [Account]] = [:]

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
        tableView.separatorStyle = .none
        tableView.backgroundColor = ViewColor.surface.color
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }

        return tableView
    }()
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension AccountListView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource[AccountType(intValue: section)]?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.cell(for: AccountTableViewCell.self, for: indexPath), let account = dataSource[AccountType(intValue: indexPath.section)]?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.configure(account: account)
        cell.selectionStyle = .none

        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let type = AccountType(intValue: section)
        let headerView = AccountTableViewHeader()

        headerView.configure(accountType: type)

        return headerView
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        .leastNormalMagnitude
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let account = dataSource[AccountType(intValue: indexPath.section)]?[indexPath.row] else { return }

        del?.openDetails(data: account)
    }
}

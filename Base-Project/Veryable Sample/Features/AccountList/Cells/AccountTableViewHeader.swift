//
//  AccountTableViewHeader.swift
//  Veryable Sample
//
//  Created by Valentyn Khimchuk on 19.12.2022.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import SnapKit

class AccountTableViewHeader: UITableViewHeaderFooterView {
    private lazy var separatorTopView: UIView = {
        let view = UIView()
        view.backgroundColor = VGrey.light.color
        addSubview(view)

        return view
    }()

    private lazy var separatorBottomView: UIView = {
        let view = UIView()
        view.backgroundColor = VGrey.light.color
        addSubview(view)

        return view
    }()

    private lazy var titleLabel = {
        let label = UILabel()
        label.font = .vryAvenirNextBold(18)
        label.textColor = VGrey.dark.color
        addSubview(label)

        return label
    }()

    func configure(accountType: AccountType) {
        switch accountType {
        case .bank:
            break
        case .card:
            separatorTopView.isHidden = true
        }

        separatorTopView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(1)
        }

        separatorBottomView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(1)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(separatorTopView.snp.bottom).offset(10)
            $0.bottom.equalTo(separatorBottomView.snp.top).offset(-10)
            $0.leading.equalTo(self).offset(20)
            $0.trailing.equalTo(self).offset(-20)
        }

        if #available(iOS 14.0, *) {
            var configuration = UIBackgroundConfiguration.listPlainHeaderFooter()
            configuration.backgroundColor = ViewColor.background.color
            backgroundConfiguration = configuration
        } else {
            backgroundColor = ViewColor.background.color
        }

        titleLabel.text = accountType.title
    }
}

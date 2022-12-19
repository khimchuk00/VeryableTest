//
//  AccountTableViewHeader.swift
//  Veryable Sample
//
//  Created by Valentyn Khimchuk on 19.12.2022.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import SnapKit

class AccountTableViewHeader: UITableViewHeaderFooterView {
    private lazy var titleLabel = {
        let label = UILabel()
        label.font = .vryAvenirNextBold(18)
        label.textColor = VGrey.dark.color
        addSubview(label)

        return label
    }()

    func configure(text: String) {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(10)
            $0.bottom.equalTo(self).offset(-10)
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

        titleLabel.text = text
    }
}

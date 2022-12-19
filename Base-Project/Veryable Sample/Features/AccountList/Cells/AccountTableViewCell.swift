//
//  AccountTableViewCell.swift
//  Veryable Sample
//
//  Created by Valentyn Khimchuk on 17.12.2022.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import SnapKit

class AccountTableViewCell: UITableViewCell {
    //MARK: - Lazy Loads
    private lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)

        return imageView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 4
        addSubview(stackView)

        return stackView
    }()

    private lazy var nextButtonImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "arrow")?.withTintColor(.gray))
        addSubview(imageView)

        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = VGrey.dark.color
        label.font = .vryAvenirNextBold(14)
        addSubview(label)

        return label
    }()

    private lazy var accountNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = VGrey.dark.color
        label.font = .vryAvenirNextRegular(12)
        addSubview(label)

        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = VGrey.normal.color
        label.font = .vryAvenirNextRegular(12)
        addSubview(label)

        return label
    }()

    func configure(account: Account) {
        configureLayout()
        configureData(account: account)
    }

    // MARK: - Private methods
    private func configureLayout() {
        mainImageView.snp.makeConstraints { make in
            make.width.height.equalTo(32)
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
        }

        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
            make.leading.equalTo(mainImageView.snp.trailing).offset(16)
        }

        nextButtonImage.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.centerY.equalTo(stackView)
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalTo(stackView.snp.trailing).offset(20)
        }

        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(accountNameLabel)
        stackView.addArrangedSubview(descriptionLabel)
    }

    private func configureData(account: Account) {
        titleLabel.text = account.accountName
        accountNameLabel.text = account.description
        descriptionLabel.text = account.accountType

        switch account.type {
        case .bank:
            mainImageView.image = UIImage(named: "bank")?.withTintColor(VBlue.normal.color)
        case .card:
            mainImageView.image = UIImage(named: "card")?.withTintColor(VBlue.normal.color)
        }
    }
}

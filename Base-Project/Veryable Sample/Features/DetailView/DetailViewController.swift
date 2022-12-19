//
//  DetailViewController.swift
//  Veryable Sample
//
//  Created by Valentyn Khimchuk on 19.12.2022.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import SnapKit

class DetailViewController: UIViewController {
    // MARK: - Inits
    init() {
        super.init(nibName: nil, bundle: nil)

        title = "Details".uppercased()
    }

    required init?(coder: NSCoder) { nil }

    private var account: Account?

    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = ViewColor.surface.color
        configureLayout()
        configureNavigationBar()
        configureData()
    }

    func configure(account: Account) {
        self.account = account
    }

    // MARK: - Private methods
    private func configureNavigationBar() {
        let backButton = UIBarButtonItem()
        backButton.tintColor = .black
        backButton.title = ""
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

        let textAttributes = [NSAttributedString.Key.foregroundColor: VGrey.dark.color]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }

    private func configureData() {
        titleLabel.text = account?.accountName
        descriptionLabel.text = account?.description
    }

    private func configureLayout() {
        containerView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().offset(0)
            make.top.equalToSuperview().offset(91)
        }

        separatorView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(1)
        }

        mainImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(124)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }

        doneButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.trailing.bottom.equalToSuperview().offset(-30)
            make.height.equalTo(60)
        }

        configureDoneButton()
    }

    @objc private func doneButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }

    private func configureDoneButton() {
        doneButton.layer.cornerRadius = 4
        doneButton.layer.shadowColor = UIColor.black.cgColor
        doneButton.layer.shadowOpacity = 0.5
        doneButton.layer.shadowRadius = 4
        doneButton.layer.shadowOffset = CGSize(width: 0, height: 0)
    }

    //MARK: Lazy Loads
    private lazy var mainImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bank")?.withTintColor(VBlue.normal.color))
        containerView.addSubview(imageView)

        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = VGrey.dark.color
        label.font = .vryAvenirNextBold(16)
        label.textAlignment = .center
        containerView.addSubview(label)

        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = VGrey.normal.color
        label.font = .vryAvenirNextRegular(12)
        label.textAlignment = .center
        containerView.addSubview(label)

        return label
    }()

    private lazy var doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("DONE", for: .normal)
        button.addTarget(self, action: #selector(doneButtonDidTap), for: .touchUpInside)
        button.backgroundColor = VBlue.normal.color
        containerView.addSubview(button)

        return button
    }()

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = ViewColor.background.color
        self.view.addSubview(view)

        return view
    }()

    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = VGrey.light.color
        containerView.addSubview(view)

        return view
    }()
}

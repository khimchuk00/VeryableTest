//
//  UITableView+Register.swift
//  Veryable Sample
//
//  Created by Valentyn Khimchuk on 19.12.2022.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(for type: T.Type) {
        let identifier = "\(type)"
        register(T.self, forCellReuseIdentifier: identifier)
    }

    func cell<T: UITableViewCell>(for type: T.Type, for indexPath: IndexPath) -> T? {
        let identifier = "\(type)"

        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            return nil
        }

        return cell
    }
}

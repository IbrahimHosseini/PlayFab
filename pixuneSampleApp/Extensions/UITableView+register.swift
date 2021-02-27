//
//  UITableView+register.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_ cell: T.Type) {
        self.register(UINib(nibName: String(describing: cell), bundle: nil), forCellReuseIdentifier: String(describing: cell))
    }
}

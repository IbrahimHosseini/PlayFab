//
//  UITableView+DequeueCell.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import UIKit

extension UITableView {
    func dequeue<T: UITableViewCell>(_ cell: T.Type) -> T {
        self.dequeueReusableCell(withIdentifier: String(describing: cell)) as! T
    }
}

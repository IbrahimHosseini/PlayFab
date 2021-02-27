//
//  UIstoryboard+Instantiation.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import UIKit

extension UIStoryboard {
    class var main: UIStoryboard {
        return self.init(name: "Main", bundle: nil)
    }
}

extension UIStoryboard {
    func instantiate<T: UIViewController>(viewController: T.Type) -> T {
        return self.instantiateViewController(withIdentifier: String(describing: T.self)) as! T
    }
}


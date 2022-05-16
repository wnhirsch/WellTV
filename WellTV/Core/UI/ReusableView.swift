//
//  ReusableView.swift
//  WellTV
//
//  Created by Wellington Nascente Hirsch on 19/04/21.
//

import UIKit

public protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView {}

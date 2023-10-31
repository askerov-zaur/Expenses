//
//  UIView+Ext.swift
//  Expenses
//
//  Created by Zaur Askerov on 25.10.23.
//

import UIKit

extension UIView {
    
    func applyCorners(to: UIRectCorner, with rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: to, cornerRadii: CGSize(width: 10, height: 10))
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        layer.mask = shape
    }
    func noCorners() {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.allCorners], cornerRadii: CGSize(width: 0, height: 0))
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        layer.mask = shape
    }
}

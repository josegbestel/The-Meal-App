//
//  Extensions.swift
//  The Meal
//
//  Created by José Guilherme Bestel on 16/01/21.
//

import UIKit

//Extension to apply custom corner radius in a layer
extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}


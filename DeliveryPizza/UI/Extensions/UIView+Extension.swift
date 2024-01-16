//
//  UIView+Extension.swift
//  DeliveryPizza
//
//  Created by ~Akhtamov on 1/14/24.
//

import UIKit.UIView

extension UIView {
    
    func addAutoLayoutSubview(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
    
    func addAutoLayoutSubviews(_ views: UIView...) {
        views.forEach { addAutoLayoutSubview($0) }
    }
}

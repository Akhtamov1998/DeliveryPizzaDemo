//
//  UIFont+Extension.swift
//  DeliveryPizza
//
//  Created by ~Akhtamov on 1/15/24.
//

import UIKit.UIFont

extension UIFont {
    enum SFUIDisplay {
        enum Bold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.SFUIDisplay.bold, size: size)!
            }
        }
        
        enum Medium {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.SFUIDisplay.medium, size: size)!
            }
        }
        
        enum Regular {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.SFUIDisplay.regular, size: size)!
            }
        }
    }
}

private extension UIFont {
    enum Constants {
        enum SFUIDisplay {
            static let bold = "SFUIDisplay-Bold"
            static let medium = "SFUIDisplay-Medium"
            static let regular = "SFUIDisplay-Regular"
        }
    }
}

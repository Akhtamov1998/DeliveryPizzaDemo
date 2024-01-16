//
//  UIColor+Extension.swift
//  DeliveryPizza
//
//  Created by ~Akhtamov on 1/15/24.
//

import UIKit.UIColor



extension UIColor {
    enum MainScreen {
        static let backgroundColor = UIColor.DeliveryPizza.gray
        enum CategoryCell {
            static let selectedBackground = UIColor.DeliveryPizza.mediumPink
            static let selectedBorderColor = UIColor.DeliveryPizza.mediumPink
            static let textColor = UIColor.DeliveryPizza.pink
            static let borderColor = UIColor.DeliveryPizza.pink
        }
        
        enum MainProductCell {
            static let priceBorderColor = UIColor.DeliveryPizza.pink
            static let priceTextColor = UIColor.DeliveryPizza.pink
            static let descriptionTextColor = UIColor.DeliveryPizza.lightGray
            static let titleTextColor = UIColor.DeliveryPizza.blue
        }
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

extension UIColor {
    enum DeliveryPizza {
        static let gray = UIColor(hexString: "#F3F5F9")
        static let pink = UIColor(hexString: "#FD3A69")
        static let mediumPink = UIColor(hexString: "#EFD1DC")
        static let lightGray = UIColor(hexString: "#AAAAAD")
        static let blue = UIColor(hexString: "#222831")
    }
}

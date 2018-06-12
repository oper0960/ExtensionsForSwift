//
//  UIColorExtension.swift
//  Pods
//
//  Created by Gilwan Ryu on 2018. 6. 12..
//
//

import UIKit

public extension UIColor {
    
    // Unify the color of the view
    public func setOneColor(_ colorRGB: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: colorRGB/255.0, green: colorRGB/255.0, blue: colorRGB/255.0, alpha: alpha)
    }
    
    // Change view color to hex value
    public convenience init?(hexString: String, alpha: CGFloat) {
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = hexString[start...]
            
            if hexColor.count == 6 {
                let scanner = Scanner(string: String(hexColor))
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255
                    a = alpha
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
}

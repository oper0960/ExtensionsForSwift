//
//  CALayerExtension.swift
//  Pods
//
//  Created by Gilwan Ryu on 2018. 6. 12..
//
//

import UIKit

public extension CALayer {
    
    // Create a border for each direction in the view
    public func setBorder(_ arr_edge: [UIRectEdge], color: UIColor, thickness: CGFloat) {
        
        for edge in arr_edge {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: thickness)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: thickness, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
                break
            default:
                break
            }
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
    
    public func setTopBorder(color: UIColor, thickness: CGFloat) {
        let border = CALayer()
        border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: thickness)
        border.backgroundColor = color.cgColor;
        self.addSublayer(border)
    }
    
    public func setBottomBorder(color: UIColor, thickness: CGFloat) {
        let border = CALayer()
        border.frame = CGRect.init(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
        border.backgroundColor = color.cgColor;
        self.addSublayer(border)
    }
    
    public func setLeftBorder(color: UIColor, thickness: CGFloat) {
        let border = CALayer()
        border.frame = CGRect.init(x: 0, y: 0, width: thickness, height: frame.height)
        border.backgroundColor = color.cgColor;
        self.addSublayer(border)
    }
    
    public func setRightBorder(color: UIColor, thickness: CGFloat) {
        let border = CALayer()
        border.frame = CGRect.init(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
        border.backgroundColor = color.cgColor;
        self.addSublayer(border)
    }
    
    // Set border by Default library simplification
    public func setBorderColor(_ width: CGFloat, color: UIColor) {
        self.borderWidth = width
        self.borderColor = color.cgColor
    }
}

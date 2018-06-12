//
//  UIViewExtension.swift
//  Pods
//
//  Created by Gilwan Ryu on 2018. 6. 12..
//
//

import UIKit

public extension UIFont {
    
    // Resolution font size Enum
    public enum TextStyle {
        case SystemBold
        case SystemRegular
        case HelveticaBold
        case HelveticaRegular
        case HelveticaLight
        case HelveticaMedium
    }
    
    // Resize fonts by screen size
    public class func resolutionFontSize(style: TextStyle,size: CGFloat) -> UIFont {
        let size_formatter = size/375
        let fontsize = UIScreen.main.bounds.width * size_formatter
        
        switch style {
        case .SystemBold:
            return UIFont.boldSystemFont(ofSize: fontsize)
        case .SystemRegular:
            return UIFont.systemFont(ofSize: fontsize)
        case .HelveticaBold:
            guard let font = UIFont(name: "HelveticaNeue-Bold", size: fontsize) else { return UIFont() }
            return font
        case .HelveticaRegular:
            guard let font = UIFont(name: "HelveticaNeue-Regular", size: fontsize) else { return UIFont() }
            return font
        case .HelveticaLight:
            guard let font = UIFont(name: "HelveticaNeue-BolLightd", size: fontsize) else { return UIFont() }
            return font
        case .HelveticaMedium:
            guard let font = UIFont(name: "HelveticaNeue-Medium", size: fontsize) else { return UIFont() }
            return font        }
    }
}

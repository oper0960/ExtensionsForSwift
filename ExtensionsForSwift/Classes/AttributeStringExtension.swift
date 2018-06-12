//
//  AttributeStringExtension.swift
//  Pods
//
//  Created by Gilwan Ryu on 2018. 6. 12..
//
//

import UIKit

public extension NSMutableAttributedString {
    
    // AttributeString simplification
    public func setAttribute(font: UIFont, color: UIColor, start: Int, length: Int) {
        self.addAttributes([NSAttributedStringKey.font: font, NSAttributedStringKey.foregroundColor: color],
                           range: NSMakeRange(start, length))
    }
}

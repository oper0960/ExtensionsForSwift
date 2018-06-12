//
//  ArrayExtension.swift
//  Pods
//
//  Created by Gilwan Ryu on 2018. 6. 12..
//
//

import UIKit

public extension Array {
    
    // Array to random item
    public var randomArrayItem: Any {
        let ramdomIndex = Int(arc4random_uniform(UInt32(self.count)))
        return self[ramdomIndex]
    }
}

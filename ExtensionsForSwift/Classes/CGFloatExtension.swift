//
//  CGFloatExtension.swift
//  Pods
//
//  Created by Gilwan Ryu on 2018. 6. 12..
//
//

import UIKit

public extension CGFloat {
    
    // Auto Width ( Standard = 4.7" )
    public func setAutoWidth(_ width: Int) -> CGFloat {
        switch UIScreen.main.bounds.width {
        case 320:   // 3.5", 4"
            return CGFloat(Float((width/375) * 320))
        case 375:   // 4.7"
            return CGFloat(Float((width/375) * 375))
        case 414:   // 5.5"
            return CGFloat(Float((width/375) * 414))
        default:
            return 0
        }
    }
    
    // Auto Height ( Standard = 4.7" )
    public func setAutoHeight(_ height: Int) -> CGFloat {
        switch UIScreen.main.bounds.width {
        case 480:   // 3.5"
            return CGFloat(Float((height/667) * 480))
        case 568:   // 4"
            return CGFloat(Float((height/667) * 568))
        case 667:   // 4.7"
            return CGFloat(Float((height/667) * 667))
        case 736:   // 5.5"
            return CGFloat(Float((height/667) * 736))
        default:
            return 0
        }
    }
}

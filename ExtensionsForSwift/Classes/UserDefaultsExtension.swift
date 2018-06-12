//
//  UserDefaultsExtension.swift
//  Pods
//
//  Created by Gilwan Ryu on 2018. 6. 12..
//
//

import UIKit

public extension UserDefaults {
    
    // UserDefaults Key & Value Save
    public func set(_ key: String, value: Any) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    // UserDefaults Key & Value Search
    public func get<T>(_ key: String) -> T? {
        return UserDefaults.standard.object(forKey: key) as? T
    }
}

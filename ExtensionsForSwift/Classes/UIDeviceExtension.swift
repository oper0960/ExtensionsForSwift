//
//  UIDeviceExtension.swift
//  Pods
//
//  Created by Gilwan Ryu on 2018. 6. 12..
//
//

import UIKit

public extension UIDevice {
    
    // Get device UUID
    public var deviceUUID: String? {
        return UIDevice.current.identifierForVendor?.uuidString ?? "Not found UUID"
    }
    
    // Get device system name
    public var deviceSystemName: String {
        return UIDevice.current.systemName
    }
    
    // Get device system version
    public var deviceSystemVersion: String {
        return UIDevice.current.systemVersion
    }
    
    // Get device name
    public var deviceName: String {
        return UIDevice.current.name
    }
    
    // Get device model
    public var deviceModel: String {
        return UIDevice.current.localizedModel
    }
    
    // Get device language
    public var deviceLanguage: String {
        return Bundle.main.preferredLocalizations[0]
    }
    
    // Get device kinds (i phone)
    public class func isiPhone() -> Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }
    
    // Get device kinds (i pad)
    public class func isiPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }
    
    // Get Hardware ModelName
    public var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod1,1":                                 return "iPod Touch 1"
        case "iPod2,1":                                 return "iPod Touch 2"
        case "iPod3,1":                                 return "iPod Touch 3"
        case "iPod4,1":                                 return "iPod Touch 4"
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6P"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6sP"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7P"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":                return "iPhone 8P"
        case "iPhone10,3", "iPhone10,6":                return "iPhone X"
        case "iPhone11,8":                              return "iPhone XR"
        case "iPhone11,2":                              return "iPhone Xs"
        case "iPhone11,6", "iPhone11,4":                return "iPhone Xs Max"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad6,11", "iPad6,12":                    return "iPad 5"
        case "iPad7,5", "iPad7,6":                      return "iPad 6"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9"
        case "iPad7,1", "iPad7,2":                      return "iPad Pro 12.9 2nd"
        case "iPad7,3", "iPad7,4":                      return "iPad Pro 10.5"
        case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":return "iPad Pro 11"
        case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":return "iPad Pro 12.9 3rd"
        case "AppleTV2,1":                              return "Apple TV 2nd"
        case "AppleTV3,1":                              return "Apple TV 3rd"
        case "AppleTV3,2":                              return "Apple TV 3rd"
        case "AppleTV5,3":                              return "Apple TV 4th"
        case "AppleTV6,2":                              return "Apple TV 4K"
        case "Watch1,1", "Watch1,2":                    return "Apple Watch 1st"
        case "Watch2,6", "Watch2,7":                    return "Apple Watch Series 1"
        case "Watch2,3", "Watch2,4":                    return "Apple Watch Series 2"
        case "Watch3,1", "Watch3,2":                    return "Apple Watch Series 3"
        case "Watch3,3", "Watch3,4":                    return "Apple Watch Series 3"
        case "Watch4,1", "Watch4,2":                    return "Apple Watch Series 4"
        case "Watch4,3", "Watch4,4":                    return "Apple Watch Series 4"
        case "AudioAccessory1,1", "AudioAccessory1,2":  return "HomePod"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
}



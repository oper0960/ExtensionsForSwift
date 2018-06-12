//
//  UINavigationControllerExtension.swift
//  GWExtensions
//
//  Created by Gilwan Ryu on 2018. 6. 12..
//

import UIKit

public extension UINavigationController {
    
    public func pushViewController(_ viewController: UIViewController, back: String, animated: Bool) {
        if let controller = self.viewControllers.last {
            let backButton = UIBarButtonItem(title: back, style:.plain, target: nil, action: nil)
            controller.navigationItem.backBarButtonItem = backButton
        }
        self.pushViewController(viewController, animated: animated)
    }
}

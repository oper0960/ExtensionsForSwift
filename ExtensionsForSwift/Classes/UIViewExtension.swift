//
//  UIViewExtension.swift
//  Pods
//
//  Created by Gilwan Ryu on 2018. 6. 12..
//
//

let defaults = UserDefaults.standard
let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

import UIKit

public extension UIView {
    
    public class func copyView() -> AnyObject {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self))! as AnyObject
    }
    
    public func nextY() -> CGFloat {
        return self.frame.origin.y + self.frame.size.height
    }
    
    public func nextX() -> CGFloat {
        return self.frame.origin.x + self.frame.size.width
    }
    
    // Set imageview square
    public func setSquareImage() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
    }
    
    // All subview remove
    public func removeAllSubviews() {
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
    }
    
    // Screen capture of the view
    public func capture(_ shadow: Bool = false) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let snapshotImageView = UIImageView(image: image)
        if shadow {
            snapshotImageView.layer.masksToBounds = false
            snapshotImageView.layer.cornerRadius = 0.0
            snapshotImageView.layer.shadowOffset = CGSize(width: -0.5, height: 0.0)
            snapshotImageView.layer.shadowRadius = 5.0
            snapshotImageView.layer.shadowOpacity = 0.4
        }
        // return image 면 UIImage, return snapshotImageView 면 UIImageView
        return image!
    }
    
    // Only at the corner want radius
    public func selectCornerRadius(direction : UIRectCorner, cornerSize: CGSize) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: direction, cornerRadii: cornerSize)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds;
        maskLayer.path = maskPath.cgPath;
        self.layer.mask = maskLayer
    }
}

public extension UIWebView {
    
    // Screen capture of the Webview
    public func capture() -> UIImage { UIGraphicsBeginImageContextWithOptions(scrollView.contentSize, scrollView.isOpaque, 0)
        let currentContentOffset = scrollView.contentOffset
        let currentFrame = scrollView.frame
        scrollView.contentOffset = CGPoint.zero
        scrollView.frame = CGRect(x: 0, y: 0, width: scrollView.contentSize.width, height: scrollView.contentSize.height)
        scrollView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        scrollView.contentOffset = currentContentOffset
        scrollView.frame = currentFrame
        UIGraphicsEndImageContext()
        return image
    }
}

public extension UITableView {
    
    // TableviewCell all select
    public func setAsSelectAll(section: Int) {
        for row in 0 ..< self.numberOfRows(inSection: section) {
            self.selectRow(at: IndexPath(row: row, section: section), animated: false, scrollPosition: .none)
        }
    }
    
    // TableviewCell all deselect
    public func setAsDeselectAll(section: Int) {
        for row in 0 ..< self.numberOfRows(inSection: section) {
            self.deselectRow(at: IndexPath(row: row, section: section), animated: false)
        }
    }
}

public extension UILabel {
    
    // get UILabel Height
    public func getLabelHeight(text: String, width: CGFloat, font: UIFont) -> CGFloat {
        let lbl = UILabel(frame: .zero)
        lbl.frame.size.width = width
        lbl.font = font
        lbl.numberOfLines = 0
        lbl.text = text
        lbl.sizeToFit()
        
        return lbl.frame.size.height
    }
}

public extension UITextField {
    
    enum PaddingType {
        case all
        case left
        case right
    }
    
    // get UITextView Height
    public func getTextViewHeight(text: String, width: CGFloat, font: UIFont) -> CGFloat {
        let tv = UITextView(frame: .zero)
        tv.frame.size.width = width
        tv.font = font
        tv.text = text
        tv.sizeToFit()
        
        return tv.frame.size.height
    }
    
    // UITextField add Padding
    func setPadding(_ direction: PaddingType, width: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        switch direction {
        case .all:
            self.leftView = paddingView
            self.rightView = paddingView
            self.leftViewMode = .always
            self.rightViewMode = .always
        case .left:
            self.leftView = paddingView
            self.leftViewMode = .always
        case .right:
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
}

public extension UIActivityIndicatorView {
    
    public func start(){
        DispatchQueue.main.async {
            self.isHidden = false
            self.startAnimating()
        }
    }
    
    public func stop(){
        DispatchQueue.main.async {
            self.isHidden = true
            self.stopAnimating()
        }
    }
}










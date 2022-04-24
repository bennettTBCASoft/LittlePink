//
//  Extension.swift
//  LittlePink
//
//  Created by 竣亦 on 2022/4/19.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable
    var corner: CGFloat {
        get{
            layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
        }
    }
}

extension Bundle{
    var appName: String{
        if let appName = localizedInfoDictionary?["CFBundleDisplayName"] as? String {
            return appName
        } else {
            return infoDictionary!["CFBundleDisplayName"] as! String
        }
    }
}

//
//  Extension.swift
//  LittlePink
//
//  Created by 竣亦 on 2022/4/19.
//

import Foundation
import UIKit

extension UITextField {
    var unwrappedText: String { text ?? "" }
}

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

extension UIViewController {
    
    // MARK:  - 顯示加載框或提示框
    
    // MARK:  加載框--手動隱藏
    func showLoadHUD(_ title: String? = nil) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = title
    }
    
    func hideLoadHUD() {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    // MARK:  提示框--自動隱藏
    func showTextHUD(_ title: String, subTitle:String? = nil){
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .text
        hud.label.text = title
        hud.detailsLabel.text = subTitle
        hud.hide(animated: true, afterDelay: 2)
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
    
    static func loadView<T>(fromNib name:String, with type: T.Type) -> T{
        if let view = Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.first as? T {
            return view
        }
        fatalError("加載\(type)類型的view失敗")
    }
}

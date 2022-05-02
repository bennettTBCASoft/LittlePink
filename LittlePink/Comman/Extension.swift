//
//  Extension.swift
//  LittlePink
//
//  Created by 竣亦 on 2022/4/19.
//

import Foundation
import UIKit
import DateToolsSwift

extension String {
    var isBlack: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

extension Date{
    // 本項目5種時間表示方式：
    // 1. 剛剛/5min ago 2. 今天21:30 3. 昨天21:30 4. 09-15 5. 2019-09-15
    var formattedDate:String{
        let currentYear = Date().year
        
        if self.year == currentYear { // 今年
            if isToday {    // 今天
                if minutesAgo > 10 {    // Note 發布（或存草稿）超過十分鐘即顯示'今天 xx:xx'
                    return "今天 \(format(with: "HH:mm"))"
                } else {
                    return timeAgoSinceNow
                }
            } else if isYesterday { // 昨天
                return "昨天 \(format(with: "HH:mm"))"
            } else { // 前天或更早的時間
                return "\(format(with: "MM-dd"))"
            }
        } else if self.year < currentYear { //去年或更早
            return "\(format(with: "yyyy-MM-dd"))"
        } else {
            return "未來的時間在這不會發生"
        }
    }
    
}

extension UIImage {
    // 便利構造器必須調用同一個類中定義的其他初始化方法
    // 便利構造器在最後必須調用一個指定構造器
    convenience init? (_ data: Data?) {
        if let unwrappedData = data {
            self.init(data: unwrappedData)
        } else {
            return nil
        }
    }
    
    enum JPEGQuality: CGFloat {
        case lowest = 0
        case low = 0.25
        case medium = 0.5
        case high = 0.75
        case highest = 1
    }
    
    func jpeg(_ jpegQuality: JPEGQuality)-> Data? {
        return jpegData(compressionQuality: jpegQuality.rawValue)
    }
}

extension UITextField {
    var unwrappedText: String { text ?? "" }
    var exactString: String {
        unwrappedText.isBlack ? "" : unwrappedText
    }
}

extension UITextView {
    var unwrappedText: String { text ?? "" }
    var exactString: String {
        unwrappedText.isBlack ? "" : unwrappedText
    }

}

@IBDesignable extension UIView {
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

@IBDesignable class RoundedCornerButton: UIButton{
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
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

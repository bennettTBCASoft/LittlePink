//
//  HomeVC.swift
//  LittlePink
//
//  Created by 竣亦 on 2022/4/17.
//

import UIKit
import XLPagerTabStrip

class HomeVC: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        
        // MARK: 設置上方的BAR, 按鈕, 條的UI
        // selectedBar--按鈕下方的條
        settings.style.selectedBarBackgroundColor = UIColor(named: "main")!
        settings.style.selectedBarHeight = 3
        
        // buttonBarItem--文本或圖片的按鈕
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemFont = UIFont.systemFont(ofSize: 16)
        settings.style.buttonBarItemLeftRightMargin = 0 // 會影響 cell width
        
        super.viewDidLoad()
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }

            oldCell?.label.textColor = .secondaryLabel
            newCell?.label.textColor = .label
        }
        
    }
    
    override public func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let followVC = storyboard!.instantiateViewController(withIdentifier: kFollowVCID)
        let discoverVC = storyboard!.instantiateViewController(withIdentifier: kDiscoverVCID)
        let nearByVC = storyboard!.instantiateViewController(withIdentifier: kNearByVCID)
        
        return [discoverVC, followVC, nearByVC]
    }

}

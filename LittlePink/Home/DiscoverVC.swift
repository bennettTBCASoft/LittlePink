//
//  DiscoverVC.swift
//  LittlePink
//
//  Created by 竣亦 on 2022/4/17.
//

import UIKit
import XLPagerTabStrip

class DiscoverVC: ButtonBarPagerTabStripViewController, IndicatorInfoProvider {

    override func viewDidLoad() {
        settings.style.selectedBarHeight = 0
        
        // buttonBarItem--文本或圖片的按鈕
        settings.style.buttonBarBackgroundColor = .clear
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemFont = UIFont.systemFont(ofSize: 14)
        settings.style.buttonBarItemLeftRightMargin = 0 // 會影響 cell width
        
        super.viewDidLoad()

        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }

            oldCell?.label.textColor = .secondaryLabel
            newCell?.label.textColor = .label
        }
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        IndicatorInfo(title: "發現")
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        var vcs:[UIViewController] = []
        
        for channel in kChannels {
            let vc = storyboard!.instantiateViewController(withIdentifier: kWaterfallVCID) as! WaterfallVC
            vc.channels = channel
            vcs.append(vc)
        }
        return vcs
    }
    
}

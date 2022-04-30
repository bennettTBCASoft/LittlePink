//
//  ChannelVC.swift
//  LittlePink
//
//  Created by 竣亦 on 2022/4/28.
//

import UIKit
import XLPagerTabStrip

class ChannelVC: ButtonBarPagerTabStripViewController {

    var PVDelegate: ChannelVCDelegate?
    
    
    override func viewDidLoad() {

        // MARK: 設置上方的BAR, 按鈕, 條的UI
        // selectedBar--按鈕下方的條
        settings.style.selectedBarBackgroundColor =  mainColor
        settings.style.selectedBarHeight = 2
        // buttonBarItem--文本或圖片的按鈕
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemFont = UIFont.systemFont(ofSize: 15)
        
        
        super.viewDidLoad()
        
        containerView.bounces = false
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .secondaryLabel
            newCell?.label.textColor = .label
        }
        
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        var vcs:[UIViewController] = []
        
        for i in kChannels.indices {
            let vc = storyboard!.instantiateViewController(withIdentifier: kChannelTableVCID) as! ChannelTableVC
            vc.channel = kChannels[i]
            vc.subChannels = kAllSubChannels[i]
            vcs.append(vc)
        }
        
        return vcs
    }
    
}

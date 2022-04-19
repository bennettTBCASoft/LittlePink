//
//  TabbarC.swift
//  LittlePink
//
//  Created by 竣亦 on 2022/4/19.
//

import UIKit

class TabbarC: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let vc = viewController as? PostVC{
            return false
        }
        return true
    }

}

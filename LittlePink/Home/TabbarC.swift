//
//  TabbarC.swift
//  LittlePink
//
//  Created by 竣亦 on 2022/4/19.
//

import UIKit
import YPImagePicker

class TabbarC: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is PostVC{
            
            //待做（判斷是否登入）
            
            
            var config = YPImagePickerConfiguration()
            
            // MARK: 通用配置
            config.isScrollToChangeModesEnabled = false
            config.onlySquareImagesFromCamera = false
            config.usesFrontCamera = false
            config.showsPhotoFilters = true
            config.showsVideoTrimmer = true
            config.shouldSaveNewPicturesToAlbum = true
            config.albumName = Bundle.main.appName
            config.startOnScreen = .library
            config.screens = [.library, .video, .photo]
            config.showsCrop = .none
            config.maxCameraZoomFactor = kMaxCameraZoomFactor
            config.library.preSelectItemOnMultipleSelection = true
            
            // MARK: 相冊配置
            config.library.mediaType = .photoAndVideo
            config.library.defaultMultipleSelection = true
            config.library.maxNumberOfItems = kMaxPhotoCount
            config.library.spacingBetweenItems = kSpacingBetweenItem
            
            // MARK: 影片配置 參照文檔，此處全部默認
            
            
            let picker = YPImagePicker(configuration: config)
            picker.didFinishPicking { [unowned picker] items, cancelled in
                if cancelled {
                    print("用戶按了左上角的取消按鈕")
                }
                
                picker.dismiss(animated: true, completion: nil)
            }
            present(picker, animated: true, completion: nil)
            return false
        }
        return true
    }

}

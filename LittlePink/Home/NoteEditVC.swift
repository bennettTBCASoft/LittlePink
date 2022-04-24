//
//  NoteEditVC.swift
//  LittlePink
//
//  Created by 竣亦 on 2022/4/24.
//

import UIKit
import YPImagePicker
import SKPhotoBrowser
import AVFoundation
import AVKit



class NoteEditVC: UIViewController {
    var photos = [
        UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!
    ]
    var videoURL: URL?
    
    var photoCounts: Int {
        return photos.count
    }
    
    var isVideo:Bool { videoURL != nil }
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension NoteEditVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCellId, for: indexPath) as! PhotoCell
        
        cell.imageView.image = photos[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            let photoFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: photoFooterId, for: indexPath) as! PhotoFooter
            
            photoFooter.addButton.addTarget(self, action: #selector(clickPhotoCellButton(_:)), for: .touchUpInside)
            
            return photoFooter
        default:
            fatalError("CollectionView 的 Footer 出問題拉")
        }
    }
    
    @objc private func clickPhotoCellButton(_ sender: UIButton){
        if photoCounts < kMaxPhotoCount {
            var config = YPImagePickerConfiguration()
            
            // MARK: 通用配置
            config.startOnScreen = .library
            config.screens = [.library]
            
            // MARK: 相冊配置
            config.library.mediaType = .photoAndVideo
            config.library.defaultMultipleSelection = true
            config.library.maxNumberOfItems = kMaxPhotoCount - photoCounts
            config.library.spacingBetweenItems = kSpacingBetweenItem
            
            let picker = YPImagePicker(configuration: config)
            picker.didFinishPicking { [unowned picker] items, _ in
                for item in items {
                    if case let .photo(photo) = item {
                        self.photos.append(photo.image)
                    }
                }
                self.photoCollectionView.reloadData()
                picker.dismiss(animated: true, completion: nil)
            }
            present(picker, animated: true, completion: nil)
        } else {
            self.showTextHUD("最多選擇\(kMaxPhotoCount)張照片哦")
        }
    }
    
}

extension NoteEditVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (isVideo) {
            let playerVC = AVPlayerViewController()
            playerVC.player = AVPlayer(url: videoURL!)
            self.present(playerVC, animated: true) {
                playerVC.player?.play()
            }
        } else {
            var images = [SKPhoto]()
            for photo in photos {
                images.append(SKPhoto.photoWithImage(photo))
            }
            // 2. create PhotoBrowser Instance, and present from your viewController.
            let browser = SKPhotoBrowser(photos: images, initialPageIndex: indexPath.item)
            SKPhotoBrowserOptions.displayDeleteButton = true
            browser.delegate = self
            present(browser, animated: true)
        }
    }
}

extension NoteEditVC: SKPhotoBrowserDelegate {
    func removePhoto(_ browser: SKPhotoBrowser, index: Int, reload: @escaping (() -> Void)) {
        
        photos.remove(at: index)
        self.photoCollectionView.reloadData()
        reload()
    }
}

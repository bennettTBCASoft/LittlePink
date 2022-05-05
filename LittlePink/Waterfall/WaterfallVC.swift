//
//  WaterfallVC.swift
//  LittlePink
//
//  Created by 竣亦 on 2022/4/17.
//

import UIKit
import CHTCollectionViewWaterfallLayout
import XLPagerTabStrip



class WaterfallVC: UICollectionViewController {

    var channels = ""
    var draftNotes: [DraftNote] = []
    var isMyDraft = true
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        setConfig()
        
        getDraftNoteData()
        
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isMyDraft ? self.draftNotes.count : 13
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if isMyDraft {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: draftNoteCellID, for: indexPath) as! DraftNoteCell
            
            cell.draftNote = self.draftNotes[indexPath.item]
            cell.deleteBtn.tag = indexPath.item
            cell.deleteBtn.addTarget(self, action: #selector(showAlertController), for: .touchUpInside)
            
            return cell

        } else {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: waterfallId, for: indexPath) as! WaterfallCell
            
            cell.imageView.image = UIImage(named: "\(indexPath.item + 1)")
            
            return cell
        }
        
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let draftNote = draftNotes[indexPath.item]
        if let photosData = draftNote.photos, let photosDataArray = try? JSONDecoder().decode([Data].self, from: photosData) {
            let image = photosDataArray.map { UIImage($0) ?? imagePH } 
            
        }
        
    }
    
}

extension WaterfallVC {
    
    // 二次確認彈出視窗
    @objc private func showAlertController(_ sender: UIButton) {
        let alertController = UIAlertController(title: "提示", message: "是否要刪除草稿", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let confirmAction = UIAlertAction(title: "確定", style: .destructive) { _ in
            self.deleteDraftNote(sender.tag)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        self.present(alertController, animated: true)
    }
    
    // 刪除草稿
    private func deleteDraftNote(_ index: Int) {
        
        let draftNote = self.draftNotes[index]
        context.delete(draftNote)
        appDelegate.saveContext()
        
        self.draftNotes.remove(at: index)
        self.collectionView.performBatchUpdates {
            self.collectionView.deleteItems(at: [IndexPath(item: index, section: 0)])
        }
    }
    
    
}
// MARK: - CHTCollectionViewDelegateWaterfallLayout
extension WaterfallVC: CHTCollectionViewDelegateWaterfallLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let cellW = (screenRect.width - (kWaterfallPadding * 3)) / 2
        var cellH: CGFloat = 0
        
        if isMyDraft {
            let draftNote = draftNotes[indexPath.item]
            let imageSize = UIImage(draftNote.coverPhoto)?.size ?? imagePH.size
            let imageRatio = imageSize.height / imageSize.width
            cellH = cellW * imageRatio + kDraftNoteCellBottomHeight
        } else {
            cellH = UIImage(named: "\(indexPath.item + 1)")!.size.height
            
        }
        return CGSize(width: cellW, height: cellH)
    }
    
    
}

extension WaterfallVC: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: channels)
    }
}

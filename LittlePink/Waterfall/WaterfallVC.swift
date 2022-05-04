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
    var draftNote: [DraftNote] = []
    var isMyDraft = true
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        setConfig()
        
        getDraftNoteData()
        
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isMyDraft ? self.draftNote.count : 13
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if isMyDraft {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: draftNoteCellID, for: indexPath) as! DraftNoteCell
            
            cell.draftNote = self.draftNote[indexPath.item]
            
            return cell

        } else {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: waterfallId, for: indexPath) as! WaterfallCell
            
            cell.imageView.image = UIImage(named: "\(indexPath.item + 1)")
            
            return cell
        }
        
    }
}
// MARK: - CHTCollectionViewDelegateWaterfallLayout
extension WaterfallVC: CHTCollectionViewDelegateWaterfallLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let cellW = (screenRect.width - (kWaterfallPadding * 3)) / 2
        var cellH: CGFloat = 0
        
        if isMyDraft {
            let draftNote = draftNote[indexPath.item]
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

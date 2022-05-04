//
//  Waterfall-Config.swift
//  LittlePink
//
//  Created by 竣亦 on 2022/5/2.
//

import CHTCollectionViewWaterfallLayout

extension WaterfallVC {
    func setConfig() {
        let layout = collectionView.collectionViewLayout as! CHTCollectionViewWaterfallLayout
        layout.columnCount = 2
        layout.minimumColumnSpacing = kWaterfallPadding
        layout.minimumInteritemSpacing = kWaterfallPadding
        layout.sectionInset = UIEdgeInsets(top: 0, left: kWaterfallPadding, bottom: kWaterfallPadding, right: kWaterfallPadding)
        
        if isMyDraft {
            layout.sectionInset.top = 44
        }
    }
}

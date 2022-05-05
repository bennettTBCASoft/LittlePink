//
//  Waterfall-loadData.swift
//  LittlePink
//
//  Created by 竣亦 on 2022/5/2.
//

import Foundation
import CoreData

extension WaterfallVC {
    func getDraftNoteData() {
        let request = DraftNote.fetchRequest() as NSFetchRequest<DraftNote>
        
        //分頁（上拉加載）
//        request.fetchOffset = 0
//        request.fetchLimit = 20
        
        // 篩選
//        request.predicate = NSPredicate(format: "title = %@", "iOS")
        
        // 排序
        let sortDesriptor = NSSortDescriptor(key: "updatedAt", ascending: false)
        request.sortDescriptors = [sortDesriptor]
        
        
        let draftNotes = try! context.fetch(request)
        self.draftNotes = draftNotes
    }
}

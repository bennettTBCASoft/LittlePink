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
        let draftNotes = try! context.fetch(DraftNote.fetchRequest() as NSFetchRequest<DraftNote>)
        self.draftNote = draftNotes
    }
}

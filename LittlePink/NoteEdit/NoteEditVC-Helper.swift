//
//  NoteEditVC-Helper.swift
//  LittlePink
//
//  Created by 竣亦 on 2022/5/6.
//

import Foundation

extension NoteEditVC {
    func validateNote() {
        guard !photos.isEmpty else {
            showTextHUD("至少需傳一張圖片或影片哦")
            return
        }
            
        guard textViewIAView.currentTextCount <= kMaxNoteTextCount else {
            showTextHUD("文本最多只能輸入\(kMaxNoteTitleCount)個字哦")
            return
        }
    }
}

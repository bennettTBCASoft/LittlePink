//
//  NoteEditVC-Config.swift
//  LittlePink
//
//  Created by 竣亦 on 2022/4/27.
//

import Foundation
import UIKit

extension NoteEditVC{
    func config() {
        
        // 目前拖放功能只能透過 coding 下面這行
        self.photoCollectionView.dragInteractionEnabled = true
        titleCountLabel.isHidden = true
        titleCountLabel.text = "\(kMaxNoteTitleCount)"
        
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: -5)
        //        textView.textContainerInset = .zero // 去除文本邊距（上下邊距）
        //        textView.textContainer.lineFragmentPadding = 0 // 去除內容縮進（左右邊距）
        
        // 在user輸入文本時，修改TextView相關內容
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        let typingAttributes: [NSAttributedString.Key : Any] = [
            .paragraphStyle: paragraphStyle,
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.secondaryLabel
        ]
        textView.typingAttributes = typingAttributes
        
        // 修改Tint Color 要在ViewDidLoad調用以下方法，才會有效果（補充：這邊Tint Color是為了改光標顏色）
        textView.tintColorDidChange()
        
        textView.inputAccessoryView = Bundle.loadView(fromNib: "TextViewIAView", with: TextViewIAView.self)
        textViewIAView.doneBtn.addTarget(self, action: #selector(clickDoneBtn), for: .touchUpInside)
        textViewIAView.maxTextCountLabel.text = "/\(kMaxNoteTextCount)"
    }
}

extension NoteEditVC {
    @objc private func clickDoneBtn() {
        textView.resignFirstResponder()
    }
}

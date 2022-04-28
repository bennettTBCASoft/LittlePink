//
//  NoteEditVC.swift
//  LittlePink
//
//  Created by 竣亦 on 2022/4/24.
//

import UIKit




class NoteEditVC: UIViewController {
    
    
    var photos = [
        UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!
    ]
    var videoURL: URL?
    
    var photoCounts: Int {
        return photos.count
    }
    
    var isVideo:Bool { videoURL != nil }
    var textViewIAView:TextViewIAView { textView.inputAccessoryView as! TextViewIAView }
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var titleCountLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }

    @IBAction func TFEditBegin(_ sender: Any) {
        titleCountLabel.isHidden = false
    }
    
    @IBAction func TFEditChanged(_ sender: Any) {
        
        // 當前有高亮文本時（漢字鍵盤） return
        guard titleTextField.markedTextRange == nil else {
            return
        }
        
        // 用戶輸入完字符後後進行判斷，若大於最大字符數，則擷取前面的文本（if裡面第一行）
        if titleTextField.unwrappedText.count > kMaxNoteTitleCount {
            titleTextField.text = String(titleTextField.unwrappedText.prefix(kMaxNoteTitleCount))
            showTextHUD("最多只能輸入\(kMaxNoteTitleCount)個字哦~")
            DispatchQueue.main.async {
                let end = self.titleTextField.endOfDocument
                self.titleTextField.selectedTextRange = self.titleTextField.textRange(from: end, to: end)
            }
            
        } 
        
        titleCountLabel.text = "\(kMaxNoteTitleCount - titleTextField.unwrappedText.count)"
    }
    
    @IBAction func TFEditEnd(_ sender: Any) {
        titleCountLabel.isHidden = true
    }
    
    // 待做（存草稿和發佈筆記之前須判斷當前用戶輸入的正文文本數量，看是否大於最大可輸入數量）
    
}

extension NoteEditVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension NoteEditVC: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        guard textView.markedTextRange == nil else { return }
        textViewIAView.currentTextCount = textView.text.count
    }
}
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        // range.location -- 當前輸入的字符或黏貼文本的第一個字符的索引
//        // string -- 當前輸入的某個字符或黏貼的文本
//        // 如果只用textField.count去判斷，會造成無法刪除字的問題
//        //  if textField.unwrappedText.count >= kMaxNoteTitleCount { return false }
//
//
//        // 限制字串長度為20，以下情況返回false(即不讓輸入)
//        // 1. 輸入的字符或黏貼的文本在整體內容的索引是20的時候(第21個不給輸入)
//        // 2. 當前輸入的字符長度+文本黏貼的長度超過20時--防止一開始一下子黏貼超過20個字符
//        let isExceed = range.location >= kMaxNoteTitleCount || (textField.unwrappedText.count + string.count) > kMaxNoteTitleCount
//
//        if isExceed {
//            showTextHUD("最多只能輸入\(kMaxNoteTitleCount)個字哦~")
//        }
//
//        return !(isExceed)
//
//    }


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
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var titleCountLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 目前拖放功能只能透過 coding 下面這行
        self.photoCollectionView.dragInteractionEnabled = true
        titleCountLabel.isHidden = true
        titleCountLabel.text = "\(kMaxNoteTitleCount)"
    }

    @IBAction func TFEditBegin(_ sender: Any) {
        titleCountLabel.isHidden = false
    }
    
    @IBAction func TFEditChanged(_ sender: Any) {
        titleCountLabel.text = "\(kMaxNoteTitleCount - titleTextField.unwrappedText.count)"
    }
    
    @IBAction func TFEditEnd(_ sender: Any) {
        titleCountLabel.isHidden = true
    }
    
}

extension NoteEditVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // range.location -- 當前輸入的字符或黏貼文本的第一個字符的索引
        // string -- 當前輸入的某個字符或黏貼的文本
        // 如果只用textField.count去判斷，會造成無法刪除字的問題
        //  if textField.unwrappedText.count >= kMaxNoteTitleCount { return false }
        
        
        // 限制字串長度為20，以下情況返回false(即不讓輸入)
        // 1. 輸入的字符或黏貼的文本在整體內容的索引是20的時候(第21個不給輸入)
        // 2. 當前輸入的字符長度+文本黏貼的長度超過20時--防止一開始一下子黏貼超過20個字符
        let isExceed = range.location >= kMaxNoteTitleCount || (textField.unwrappedText.count + string.count) > kMaxNoteTitleCount

        if isExceed {
            showTextHUD("最多只能輸入\(kMaxNoteTitleCount)個字哦~")
        }
        
        return !(isExceed)
        
    }
}

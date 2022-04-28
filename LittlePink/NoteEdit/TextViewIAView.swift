//
//  TextViewIAView.swift
//  LittlePink
//
//  Created by 竣亦 on 2022/4/27.
//

import UIKit

class TextViewIAView: UIView {

    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var textCountStackVuew: UIStackView!
    @IBOutlet weak var textCountLabel: UILabel!
    @IBOutlet weak var maxTextCountLabel: UILabel!
    
    var currentTextCount = 0 {
        didSet {
            if currentTextCount <= kMaxNoteTextCount {
                doneBtn.isHidden = false
                textCountStackVuew.isHidden = true
            } else {
                doneBtn.isHidden = true
                textCountStackVuew.isHidden = false
                textCountLabel.text = "\(currentTextCount)"
            }
        }
    }

}

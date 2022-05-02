//
//  DraftNoteCell.swift
//  LittlePink
//
//  Created by 竣亦 on 2022/5/2.
//

import UIKit

class DraftNoteCell: UICollectionViewCell {
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var isVideoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    
    var draftNote: DraftNote? {
        didSet {
            guard let draftNote = draftNote else { return }
            
            let title = draftNote.title!
            titleLabel.text = title.isEmpty ? "無題": draftNote.title
            
            imageView.image = UIImage(draftNote.coverPhoto) ?? imagePH
            
            dateLabel.text = draftNote.updatedAt?.formattedDate
            
            isVideoImageView.isHidden = !draftNote.isVideo
        }
    }
}

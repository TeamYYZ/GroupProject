//
//  SelfMessageCell.swift
//  Dine
//
//  Created by Senyang Zhuang on 3/30/16.
//  Copyright © 2016 YYZ. All rights reserved.
//

import UIKit

class SelfMessageCell: UITableViewCell {

    @IBOutlet weak var screenNameLabel: UILabel!
    
    
    @IBOutlet weak var contentLabel: UILabel!
    
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var timeLabelHeight: NSLayoutConstraint!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var textView: UIView!
        
    var maxSize: CGSize {
        get {
            // MARK: 116 = width of all views ocuppied except UILabel
            let maxWidth = CGRectGetWidth(self.bounds) - 116
            let maxHeight = CGFloat.max
            return CGSize(width: maxWidth, height: maxHeight)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.textView.layer.cornerRadius = 8.0
        self.contentLabel.textColor = ColorTheme.sharedInstance.chatMyMessageColor
        self.textView.backgroundColor = ColorTheme.sharedInstance.chatMyBackgroudColor
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

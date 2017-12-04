//
//  NotificationsHeaderCell.swift
//  Whoop
//
//  Created by Abdul Baseer on 13/11/2017.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit

class NotificationsHeaderCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(image: UIImage, text: String) {
        iconImageView.image = image
        titleLabel.text = text
    }

}

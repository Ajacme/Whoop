//
//  DealsCell.swift
//  Whoop
//
//  Created by Abdul Baseer on 12/11/2017.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit

class DealsCell: UITableViewCell {

    
    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var infoImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dealLeftLabel: UILabel!
    @IBOutlet weak var dealNameLabel: UILabel!
    @IBOutlet weak var dealImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        lockImageView.image = #imageLiteral(resourceName: "lock_icon").withRenderingMode(.alwaysTemplate)
        infoImageView.image = #imageLiteral(resourceName: "info_icon").withRenderingMode(.alwaysTemplate)
    }
    
    func set(image: UIImage, text: String) {
        dealImageView.image = image
        dealNameLabel.text = text
    }
}

//
//  ListingCell.swift
//  Whoop
//
//  Created by Abdul Baseer on 11/11/2017.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit

class ListingCell: UITableViewCell {

    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var detailsHeight: NSLayoutConstraint!
    @IBOutlet weak var descriptionBoldLabel: UILabel!
   
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var descriptionBoldHeight: NSLayoutConstraint!
    @IBOutlet weak var descriptionHeight: NSLayoutConstraint!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var userNameHeight: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(with image: UIImage, userName: String? = nil, description: String? = nil, boldDescription: String? = nil, details: String? = nil ) {
        set(label: userNameLabel, constraint: userNameHeight, text: userName)
        set(label: detailsLabel, constraint: detailsHeight, text: details)
        set(label: descriptionLabel, constraint: descriptionHeight, text: description)
        set(label: descriptionBoldLabel, constraint: descriptionBoldHeight, text: boldDescription)
        
    }
    
    private func set(label: UILabel, constraint: NSLayoutConstraint, text: String?) {
        let height = label.getHeightAndSet(text: text)
        constraint.constant = height
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension UILabel {
    func getHeightAndSet(text string: String?) -> CGFloat {
        if let newText = string {
            text = newText
            return getTextHeight()
        } else {
            return 0
        }
    }
    func getTextHeight() -> CGFloat {
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        
        return label.frame.height
    }
}

//
//  CardsCell.swift
//  Whoop
//
//  Created by Abdul Baseer on 13/11/2017.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit

typealias SwipeEvent = (UITableViewRowAnimation, Int) -> Void
class CardsCell: UITableViewCell {

    private var pageIndex = 0
    private var cellSwiped: SwipeEvent?
    private var totalPages = 0
    
    @IBOutlet weak var topCircleImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var bannerImageView: UIImageView!
    
    @IBOutlet weak var bannerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var bannerView: UIView!
    
    @IBOutlet weak var detailsLabel: UILabel!
    
    @IBOutlet weak var hyperLinkLabel: UILabel!
    @IBOutlet var unlockHomesDeal: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(data: [CardsDetails], selectedIndex: Int, onSwipe: SwipeEvent?) {
        
        pageIndex = selectedIndex
        cellSwiped = onSwipe
        totalPages = data.count

        // PageControl Settings
        pageControl.numberOfPages = data.count
        pageControl.currentPage = pageIndex
        
        let currentRecord = data[selectedIndex]
        cellSettings(record: currentRecord)
        
        
        
        addSwipe()
        
    }
    
    func cellSettings(record: CardsDetails) {
        titleLabel.text = record.title
        detailsLabel.text = record.description
        topCircleImageView.image = record.userImage
        if let bannerImage = record.bannerImage {
            bannerImageView.image = bannerImage
            bannerView.isHidden = false
            bannerViewHeight.constant = 216
        } else {
            bannerView.isHidden = true
            bannerViewHeight.constant = 40
        }
        
        if record.title == "Big brands and local businesses can't wait to Whoop! You happy with lower prices." && pageIndex == 0{
            self.hyperLinkLabel.textColor = UIColor.black
            let textToChange = "The deal is unlocked, Unlocked by: Sandip Gopani"
            let attributedString    = NSMutableAttributedString(string: textToChange)
            let range               = (textToChange as NSString).range(of: "The deal is unlocked, Unlocked by:")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.colorWithHexString(hex: "FE8B3A"), range: range)
            
            self.hyperLinkLabel.attributedText = attributedString
        }else{
            self.hyperLinkLabel.textColor = UIColor.blue
            let textToChange = "Unlock your home's deal for free"
            let attributedString    = NSMutableAttributedString(string: textToChange)
            let range               = (textToChange as NSString).range(of: textToChange)
            
            attributedString.addAttribute(NSAttributedStringKey.underlineStyle, value: NSNumber(value: 1), range: range)
            attributedString.addAttribute(NSAttributedStringKey.underlineColor, value: UIColor.blue, range: range)
 
            self.hyperLinkLabel.attributedText = attributedString
        }
    }
    
    private func addSwipe() {
        let leftGesture = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipe))
        leftGesture.direction = .left
        self.addGestureRecognizer(leftGesture)
        
        let rightGesture = UISwipeGestureRecognizer(target: self, action: #selector(rightSwipe))
        rightGesture.direction = .right
        self.addGestureRecognizer(rightGesture)
    }
    
    @objc func rightSwipe() {
        if pageIndex > 0 {
            cellSwiped?(.right, pageIndex - 1)
        }
    }
    
    @objc func leftSwipe() {
        if pageIndex < totalPages - 1 {
            cellSwiped?(.left, pageIndex + 1)
        }
    }
    
//    @IBAction func unlockButtonTapped(_ sender: UIButton) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mapViewControllerObj = storyboard.instantiateViewController(withIdentifier: "WebDealDetailVC") as? WebDealDetailVC
//        self.navigationController?.pushViewController(mapViewControllerObj!, animated: true)
//    }
    
}

class CardsDetails {
    var title: String
    var description: String
    var userImage: UIImage
    var bannerImage: UIImage?
    init(title tit: String, description desc: String, userImage image: UIImage, bannerImage bImage: UIImage? = nil) {
        title = tit
        description = desc
        userImage = image
        bannerImage = bImage
    }
}

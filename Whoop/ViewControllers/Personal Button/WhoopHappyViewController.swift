//
//  WhoopHappyViewController.swift
//  Whoop
//
//  Created by iOS on 20/11/17.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit
import JHChainableAnimations

class WhoopHappyViewController: UIViewController {
    @IBOutlet weak var btnWhoopImgVew: UIImageView!
//    @IBOutlet weak var discriptionStackView: UIStackView!
    @IBOutlet weak var DealStckVew: UIStackView!
    @IBOutlet weak var btnStckVew: UIStackView!
    @IBOutlet var circleViews: [UIView]!
    @IBOutlet var yourPersonalButtonLabel: UILabel!
    @IBOutlet var greenRedlabelText: UILabel!
    @IBOutlet var infoIcon: UIImageView!
    @IBOutlet var redgreeenView: UIView!
    var isGreen = false
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPersonalView()
        btnWhoopImgVew.alpha = 0
        DealStckVew.alpha = 0
//        discriptionStackView.alpha = 0
        btnStckVew.alpha = 0
        
       
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        for circleView in circleViews {
            circleView.layer.cornerRadius = circleView.frame.width/2
        }
        
        let animator1 = JHChainableAnimator(view: btnWhoopImgVew)
        animator1?.moveY()(300)?.thenAfter()(0.01)?.moveY()(-300)?.makeOpacity()(1)?.animate()(0.37)
        
        let animator2 = JHChainableAnimator(view: DealStckVew)
        animator2?.moveY()(200)?.thenAfter()(0.1)?.moveY()(-200)?.makeOpacity()(1)?.animate()(0.37)
        
//        let animator3 = JHChainableAnimator(view: discriptionStackView)
//        animator3?.moveY()(200)?.thenAfter()(0.15)?.moveY()(-200)?.makeOpacity()(1)?.animate()(0.37)
        
        let animator4 = JHChainableAnimator(view: btnStckVew)
        animator4?.moveY()(200)?.thenAfter()(0.2)?.moveY()(-200)?.makeOpacity()(1)?.animate()(0.37)
        
    }
    func setupPersonalView(){
        
        if isGreen{ // For Yellow
            let labelText = "You've requested a unique code to unlock your home's button at 16, Westway, London, SW1 1AW"
            let range               = (labelText as NSString).range(of: "16, Westway, London, SW1 1AW")
            let attributedString    = NSMutableAttributedString(string: labelText)
            
            //        attributedString.addAttribute(NSLinkAttributeName, value: NSURL("http://www.google.fr")!, range: range)
            attributedString.addAttribute(NSAttributedStringKey.underlineStyle, value: NSNumber(value: 1), range: range)
            attributedString.addAttribute(NSAttributedStringKey.underlineColor, value: UIColor.colorWithHexString(hex: "FF6013"), range: range)
            
            greenRedlabelText.textColor = UIColor.red
            greenRedlabelText.attributedText = attributedString
            redgreeenView.backgroundColor = UIColor.colorWithHexString(hex: "FBEB32")
            infoIcon.isHidden = true
            
        }else{
            yourPersonalButtonLabel.textColor = UIColor.white
            redgreeenView.backgroundColor = UIColor.colorWithHexString(hex: "FE2502")
        }
    }
    
    @IBAction func settingsButtonTapped(_ sender: Any) {
    }
   
    }




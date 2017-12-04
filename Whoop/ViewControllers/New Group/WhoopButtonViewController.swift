//
//  WhoopButtonViewController.swift
//  Whoop
//
//  Created by ZaeemZafar on 11/8/17.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit
import JHChainableAnimations

class WhoopButtonViewController: UIViewController {

    @IBOutlet weak var dealsStackView: UIStackView!
    @IBOutlet weak var whoopButtonImageView: UIImageView!
    @IBOutlet weak var descriptionStackView: UIStackView!
    @IBOutlet var yourHomeLabel: UILabel!
    @IBOutlet var secondLineLabel: UILabel!
    @IBOutlet weak var buttonsStackView: UIStackView!
    
    @IBOutlet var circleViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        whoopButtonImageView.alpha = 0
        dealsStackView.alpha = 0
//        descriptionStackView.alpha = 0
        buttonsStackView.alpha = 0
       
        
        
        let range               = ("16, Westway, London, SW1 1AW" as NSString).range(of: "16, Westway, London, SW1 1AW")
        let attributedString    = NSMutableAttributedString(string: "16, Westway, London, SW1 1AW")
        
//        attributedString.addAttribute(NSLinkAttributeName, value: NSURL("http://www.google.fr")!, range: range)
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        
        attributedString.addAttribute(NSAttributedStringKey.underlineStyle, value: NSNumber(value: 1), range: range)
        attributedString.addAttribute(NSAttributedStringKey.underlineColor, value: UIColor.white, range: range)
        
        attributedString.addAttributes([NSAttributedStringKey.paragraphStyle: paragraph], range: range)
        
        yourHomeLabel.text = "Your home's Whoop! Button is unlocked at"
        secondLineLabel.attributedText = attributedString
        
        yourHomeLabel.textColor = UIColor.white
        secondLineLabel.textColor = UIColor.white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        for circleView in circleViews {
            circleView.layer.cornerRadius = circleView.frame.width/2
        }
        
        let animator1 = JHChainableAnimator(view: whoopButtonImageView)
        animator1?.moveY()(300)?.thenAfter()(0.01)?.moveY()(-300)?.makeOpacity()(1)?.animate()(0.37)
        
        let animator2 = JHChainableAnimator(view: dealsStackView)
        animator2?.moveY()(200)?.thenAfter()(0.1)?.moveY()(-200)?.makeOpacity()(1)?.animate()(0.37)
        
//        let animator3 = JHChainableAnimator(view: descriptionStackView)
//        animator3?.moveY()(200)?.thenAfter()(0.15)?.moveY()(-200)?.makeOpacity()(1)?.animate()(0.37)
        
        let animator4 = JHChainableAnimator(view: buttonsStackView)
        animator4?.moveY()(200)?.thenAfter()(0.2)?.moveY()(-200)?.makeOpacity()(1)?.animate()(0.37)
        
    }
    
    
    @IBAction func settingsButtonTapped(_ sender: Any) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


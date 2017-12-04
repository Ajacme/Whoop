//
//  MessageCentreViewController.swift
//  Whoop
//
//  Created by ZaeemZafar on 12/11/2017.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit

enum MessageCenterTapOption: Int {
    case all = 0, unlocks, wmh
}

class MessageCentreViewController: UIViewController {

    @IBOutlet weak var typeSegmentControl: UISegmentedControl!
    
    
    
    @IBOutlet weak var logoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - View setup
    func setupView() {
        
        if let allButton = self.view.viewWithTag(MessageCenterTapOption.all.rawValue) as? UIButton {
            allButton.isSelected = true
        }
        
        self.logoImageView.image = #imageLiteral(resourceName: "logo_icon").withRenderingMode(.alwaysTemplate)
        
 
        
    }

    func clearButtonSelection() {
        

    }
    
    // MARK: - User Actions
    @IBAction func optionButtonTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        let buttonTapped = MessageCenterTapOption(rawValue: sender.tag)!
        
        switch buttonTapped {
        case .all:
            print("All button tapped")
            
            
        case .unlocks:
            print("All button tapped")
        case .wmh:
            print("All button tapped")
        }
        
    }
    
    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        
        let optionSelected = MessageCenterTapOption(rawValue: sender.selectedSegmentIndex)!

        print("selected index is \(sender.isSelected)")
        
        switch optionSelected {

        case .all:
            print("All button tapped")
        case .unlocks:
            print("unlock button tapped")
        case .wmh:
            print("wmh button tapped")
        }
        

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

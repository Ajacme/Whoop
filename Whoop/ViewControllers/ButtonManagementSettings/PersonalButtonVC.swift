//
//  PersonalButtonVC.swift
//  Whoop!
//
//  Created by Dilip Manek on 07/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

//MARK: - View Controller
class PersonalButtonVC: UIViewController {

    //Outlets
    @IBOutlet var controlGetProfile: UIControl!
    @IBOutlet var btnSave: MTButton!
    @IBOutlet var btnFinish: MTButton!
    
    //Variables
    
    //MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Tapped Events
    @IBAction func tappedOnControlGetProfile(_ sender: Any) {
        
    }
    
    @IBAction func tappedOnBtnSave(_ sender: Any) {
        
    }
    
    @IBAction func tappedOnBtnFinish(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

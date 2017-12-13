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
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.clear
    }
    
    @IBAction func tappedOnBtnFinish(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

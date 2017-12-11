//
//  WriteForJobViewController.swift
//  Whoop
//
//  Created by ACMEUNIVERSE MAC-2 on 11/12/17.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit

class WriteForJobViewController: UIViewController {

    @IBOutlet var jobsTextField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        jobsTextField.layer.borderWidth = 1
        jobsTextField.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapSelectDate(_ sender: Any) {
        if let initVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectTimeViewController") as? SelectTimeViewController{
            self.navigationController?.pushViewController(initVC, animated: true)
        }
    }
    @IBAction func tapBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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

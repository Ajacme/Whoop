//
//  WriteForJobViewController.swift
//  Whoop
//
//  Created by ACMEUNIVERSE MAC-2 on 11/12/17.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit

class WriteForJobViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var btnSelectYourDate: UIButton!
    @IBOutlet weak var lblSelectDate: UILabel!
    @IBOutlet var jobsTextField: UITextView!
    
    var isTextFieldText = true
    override func viewDidLoad() {
        super.viewDidLoad()

        jobsTextField.layer.borderWidth = 1
        jobsTextField.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        // Do any additional setup after loading the view.
        
        jobsTextField.delegate = self
        jobsTextField.text = "Please write about your job here."
        jobsTextField.textColor = .lightGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK :- Textview Delegate Methods
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        if (textView.text == "Please write about your job here.")
        {
            textView.text = ""
            textView.textColor = .black
//            lblSelectDate.textColor = UIColor.black
//            isTextFieldText = true
        }
        textView.becomeFirstResponder() //Optional
    }
    
    func textViewDidEndEditing(_ textView: UITextView)
    {
        if (textView.text == "")
        {
            textView.text = "Please write about your job here."
            textView.textColor = .lightGray
//            lblSelectDate.textColor = UIColor.darkGray
//            isTextFieldText = false
        }
        textView.resignFirstResponder()
    }
    
    @IBAction func tapSelectDate(_ sender: Any) {
        if isTextFieldText == true{
            if let initVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectTimeViewController") as? SelectTimeViewController{
                self.navigationController?.pushViewController(initVC, animated: true)
            }
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

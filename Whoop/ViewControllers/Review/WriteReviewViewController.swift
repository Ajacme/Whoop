//
//  WriteReviewViewController.swift
//  Whoop
//
//  Created by ACMEUNIVERSE MAC-2 on 06/12/17.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit

class WriteReviewViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var lblPostReview: UILabel!
    @IBOutlet weak var btnPostReview: UIButton!
    @IBOutlet var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        // Do any additional setup after loading the view.
        
//
        textView.delegate = self
        textView.text = "Please write about my work here."
        textView.textColor = .lightGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK :- Textview Delegate Methods
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        if (textView.text == "Please write about my work here.")
        {
            textView.text = ""
            textView.textColor = .black
//            lblPostReview.textColor = UIColor.black
//            btnPostReview.isUserInteractionEnabled = true
        }
        textView.becomeFirstResponder() //Optional
    }
    
    @IBAction func tapPostReview(_ sender: Any) {
       
    }
    func textViewDidEndEditing(_ textView: UITextView)
    {
        if (textView.text == "")
        {
            textView.text = "Please write about my work here."
            textView.textColor = .lightGray
//            lblPostReview.textColor = UIColor.darkGray
//            btnPostReview.isUserInteractionEnabled = false
        }
        textView.resignFirstResponder()
    }
    

    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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

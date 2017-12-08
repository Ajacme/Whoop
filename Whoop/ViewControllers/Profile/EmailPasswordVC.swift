//
//  EmailPasswordVC.swift
//  Whoop!
//
//  Created by Dilip Manek on 07/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

//MARK: - View Controller
class EmailPasswordVC: UIViewController, CustomToolBarDelegate, UITextFieldDelegate  {

    //Outlets
    @IBOutlet var viewEmailContainer: UIView!
    @IBOutlet var viewPwdContainer: UIView!
    @IBOutlet var txtFieldEmail: UITextField!
    @IBOutlet var txtFieldPwd: UITextField!
    @IBOutlet var imgViewEmailIcon: UIImageView!
    @IBOutlet var imgViewEmailEditIcon: UIImageView!
    @IBOutlet var imgViewPwdIcon: UIImageView!
    @IBOutlet var imgViewPwdEditIcon: UIImageView!
    @IBOutlet var controlBackBtn: UIControl!
    @IBOutlet var constrainTop_ViewContainerToImageView: NSLayoutConstraint!
    @IBOutlet var constraintTop_ImgViewToSuper: NSLayoutConstraint!
    
    //Variables
    var toolBar : CustomToolBar = CustomToolBar.init(frame: CGRect(x: 0, y: 0, width: ScreenSize.WIDTH, height: 40),isSegment: true)

    //MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        if ScreenSize.HEIGHT == 568 {
            constrainTop_ViewContainerToImageView.constant = 60
            constraintTop_ImgViewToSuper.constant = 35
            view.layoutIfNeeded()
        }
        
        txtFieldEmail.setPlaceholderTextColor(color: UIColor(red: 153.00/255.00, green: 154.00/255.00, blue: 155.00/255.00, alpha: 1))
        txtFieldPwd.setPlaceholderTextColor(color: UIColor(red: 153.00/255.00, green: 154.00/255.00, blue: 155.00/255.00, alpha: 1))
        //Action Event To Redirect when tap on txtfield
        txtFieldEmail.addTarget(self, action: #selector(txtFieldUserNameOn(_:)),for: .editingDidBegin)
        txtFieldPwd.addTarget(self, action: #selector(txtFieldPasswordOn(_:)),for: .editingDidBegin)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.view.endEditing(true)
    }
    
    // MARK: - Toolbar Keyboard
    func toolbarInit(textField: UITextField) -> UIToolbar
    {
        toolBar.delegate1 = self
        toolBar.txtField = textField
        return toolBar;
    }
    // MARK: - Custom ToolBar Delegates
    func closeKeyBoard() {
        self.view.endEditing(true)
    }
    
    func getSegmentIndex(segmentIndex: Int,selectedTextField: UITextField) {
        print(selectedTextField.tag)
        if segmentIndex == 1 {
            
            if let nextField = self.view.viewWithTag(selectedTextField.tag + 1) as? UITextField {
                print(nextField.tag)
                nextField.becomeFirstResponder()
            }
                
            else {
                self.view.endEditing(true)
            }
        }
        else{
            if let nextField = self.view.viewWithTag(selectedTextField.tag - 1) as? UITextField {
                nextField.becomeFirstResponder()
            }
            else {
                // Not found, so remove keyboard.
                self.view.endEditing(true)
            }
        }
    }
    
    // MARK: - Textfield tap Event
    
    @objc func txtFieldUserNameOn(_ textField: UITextField) {
        self.view.endEditing(true)
        let initVC = self.storyboard?.instantiateViewController(withIdentifier: "NewEmailVC") as! NewEmailVC
        self.navigationController?.pushViewController(initVC, animated: true)
    }
    @objc func txtFieldPasswordOn(_ textField: UITextField) {
        self.view.endEditing(true)
        let initVC = self.storyboard?.instantiateViewController(withIdentifier: "NewPasswordVC") as! NewPasswordVC
        self.navigationController?.pushViewController(initVC, animated: true)
    }
    
    //MARK: - Textfield Delegate Method
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        
        textField.autocorrectionType = .no
//        textField.contentVerticalAlignment = .center
        textField.inputAccessoryView = toolbarInit(textField: textField)
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        print("TextField should return method called")
        textField.resignFirstResponder();
        return true;
    }

    //MARK: - Tapped Events
    @IBAction func tappedOnControlBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

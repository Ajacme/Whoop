//
//  NewPasswordVC.swift
//  Whoop!
//
//  Created by Dilip Manek on 07/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

//MARK: - View Controller
class NewPasswordVC: UIViewController, CustomToolBarDelegate, UITextFieldDelegate {

    //Outlets
    @IBOutlet var lblChangePwd: UILabel!
    @IBOutlet var viewNewPwdContainer: UIView!
    @IBOutlet var viewConfirmPwdContainer: UIView!
    @IBOutlet var txtFieldNewPwd: UITextField!
    @IBOutlet var txtFieldConfirmPwd: UITextField!
    @IBOutlet var imgViewNewPwd: UIImageView!
    @IBOutlet var imgViewConfirmPwd: UIImageView!
    @IBOutlet var btnSave: UIButton!
    
    //Variables
    var toolBar : CustomToolBar = CustomToolBar.init(frame: CGRect(x: 0, y: 0, width: ScreenSize.WIDTH, height: 40),isSegment: true)

    //MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        txtFieldNewPwd.setPlaceholderTextColor(color: UIColor(red: 153.00/255.00, green: 154.00/255.00, blue: 155.00/255.00, alpha: 1))
        txtFieldConfirmPwd.setPlaceholderTextColor(color: UIColor(red: 153.00/255.00, green: 154.00/255.00, blue: 155.00/255.00, alpha: 1))
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    //MARK: - Textfield Delegate Method
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        
        textField.autocorrectionType = .no
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
    @IBAction func tappedOnBtnSave(_ sender: UIButton) {
        self.view.endEditing(true)
        self.navigationController?.popViewController(animated: true)

    }
    
    
}

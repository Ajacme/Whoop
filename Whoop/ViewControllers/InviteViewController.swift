//
//  InviteViewController.swift
//  Whoop
//
//  Created by emitech990 on 22/11/17.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit

class InviteViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var txtEnterInviteEmail: UITextField!
    @IBOutlet weak var viewMainAlert: UIView!
    @IBOutlet weak var btnGo: UIButton!
    @IBOutlet weak var viewinnerAlert: UIView!
    @IBOutlet weak var viewTextFieldBack: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        //set delegate
        self.txtEnterInviteEmail.delegate=self
        
        //set Button Go BorderColor and Width
        self.btnGo.layer.borderColor = UIColor.init(red:253/255.0, green:86/255.0, blue:18/255.0, alpha: 1.0).cgColor
        self.btnGo.layer.borderWidth = 1
        self.btnGo.layer.cornerRadius=4.0
        self.btnGo.clipsToBounds=true
        
        //set UITextfield CornerRadious and Border width and color
        self.viewTextFieldBack.layer.cornerRadius=4.0
        self.viewTextFieldBack.clipsToBounds=true
        self.txtEnterInviteEmail.layer.borderColor = UIColor.init(red:149/255.0, green:150/255.0, blue:151/255.0, alpha: 0.2).cgColor
        self.txtEnterInviteEmail.layer.borderWidth = 1
        self.txtEnterInviteEmail.layer.cornerRadius=4.0
        self.txtEnterInviteEmail.clipsToBounds=true
        
        //set view textfield back Shadow
        self.viewTextFieldBack.layer.masksToBounds = false
        self.viewTextFieldBack.layer.shadowColor = UIColor.init(red:149/255.0, green:150/255.0, blue:151/255.0, alpha: 0.8).cgColor
        self.viewTextFieldBack.layer.shadowOffset = CGSize()
        self.viewTextFieldBack.layer.shadowOpacity = 0.5
        
        //set UITextFied leading space
        let indentView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        txtEnterInviteEmail.leftView = indentView
        txtEnterInviteEmail.leftViewMode = .always
        
        //hidden alert UIView
        self.viewMainAlert.isHidden=true
        
        self.viewinnerAlert.layer.cornerRadius=4
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- UITextfield Delegate
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        //set textfield border color and width
        self.txtEnterInviteEmail.layer.borderColor = UIColor.init(red:253/255.0, green:86/255.0, blue:18/255.0, alpha: 0.2).cgColor
        self.txtEnterInviteEmail.layer.borderWidth = 1
        self.txtEnterInviteEmail.layer.cornerRadius=4.0
        self.txtEnterInviteEmail.clipsToBounds=true
        
        //set textfield shadow
        self.viewTextFieldBack.layer.masksToBounds = false
        self.viewTextFieldBack.layer.shadowColor = UIColor.init(red:253/255.0, green:86/255.0, blue:18/255.0, alpha: 0.8).cgColor
        self.viewTextFieldBack.layer.shadowOffset = CGSize()
        self.viewTextFieldBack.layer.shadowOpacity = 0.5
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
        //set textfield border color and width
        self.txtEnterInviteEmail.layer.borderColor = UIColor.init(red:149/255.0, green:150/255.0, blue:151/255.0, alpha: 0.2).cgColor
        self.txtEnterInviteEmail.layer.borderWidth = 1
        self.txtEnterInviteEmail.layer.cornerRadius=4.0
        self.txtEnterInviteEmail.clipsToBounds=true
        
        //set txtfield shadow
        self.viewTextFieldBack.layer.masksToBounds = false
        self.viewTextFieldBack.layer.shadowColor = UIColor.init(red:149/255.0, green:150/255.0, blue:151/255.0, alpha: 0.8).cgColor
        self.viewTextFieldBack.layer.shadowOffset = CGSize()
        self.viewTextFieldBack.layer.shadowOpacity = 0.5
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true;
    }
    
    //MARK:- UIButton Action
    @IBAction func btnGo(_ sender: Any) {
        self.txtEnterInviteEmail.text=nil
        self.viewMainAlert.isHidden=false
    }
    
    @IBAction func btnOkAlert(_ sender: Any) {
        self.viewMainAlert.isHidden=true
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        
         self.navigationController?.isNavigationBarHidden = false
         navigationController?.popViewController(animated: true)
        
    }
}


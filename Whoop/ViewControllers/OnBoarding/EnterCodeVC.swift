
//
//  EnterCodeVC.swift
//  Whoop!
//
//  Created by Dilip manek on 01/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

class EnterCodeVC: UIViewController,CustomToolBarDelegate {
    @IBOutlet weak var imageTop: UIImageView!
    @IBOutlet weak var imageLeft: UIImageView!
    @IBOutlet weak var imageRight: UIImageView!
    @IBOutlet weak var imageBottom: UIImageView!
      var newImage: UIImage!
    @IBOutlet weak var txtEnterCode: UITextField!
    var toolBar : CustomToolBar = CustomToolBar.init(frame: CGRect(x: 0, y: 0, width: ScreenSize.WIDTH, height: 40),isSegment: false)
    var objCodePopUp = ViewForCodePopUp()

    override func viewDidLoad() {
        super.viewDidLoad()
        if newImage != nil{
            imageTop.image = newImage
        }
        let indentView = UIView(frame: CGRect(x: 0, y: 0, width: 17, height: 20))
        txtEnterCode.leftView = indentView
        txtEnterCode.leftViewMode = .always

        txtEnterCode.autocorrectionType = .no
        txtEnterCode.inputAccessoryView = toolbarInit(textField: txtEnterCode)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK:- Status Bar Set Light Content
    override var prefersStatusBarHidden: Bool {
        return false
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.clear
    }
    
    // MARK: - Click events..
    @IBAction func tapToGo(_ sender: UIButton) {
        
        let text = txtEnterCode.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if (text?.characters.count)! > 0
        {
            self.view.endEditing(true)
            self.customChatView()
        }else
        {
            showAlert(title: "Alert", message: "Please enter code!")
        }
    }
    @IBAction func tapToChangeAddress(_ sender: UIButton) {
        
    }
    
    @IBAction func tapToPopupClose(_ sender: UIButton) {
        self.objCodePopUp.removeFromSuperview()
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
    
    // MARK: - CustumeView Design For PopUp
    func customChatView()  {
        
        if let objHomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WhoopButtonViewController") as?   WhoopButtonViewController{
            objHomeVC.isGreen = true
        
            
            self.navigationController?.pushViewController(objHomeVC, animated: true)
        }
        
            /*objCodePopUp = Bundle.main.loadNibNamed("ViewForCodePopUp", owner: self, options: nil)?.first as! ViewForCodePopUp
            self.objCodePopUp.frame = CGRect(x: 0, y:0, width:ScreenSize.WIDTH, height:ScreenSize.HEIGHT)
            objCodePopUp.lblTitle.text = ""
            objCodePopUp.backgroundColor = UIColor.clear
            self.view.addSubview(objCodePopUp)
            UIView.animate(withDuration: 0.5) {
                //self.objCodePopUp.alpha = 0.5
                self.objCodePopUp.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
                self.objCodePopUp.Cons_ViewTop.constant = 40
                self.view.layoutIfNeeded()
            }
            self.objCodePopUp.btnClose.addTarget(self, action: #selector(self.tapToPopupClose(_:)), for: .touchUpInside)
            self.objCodePopUp.btnCancel.addTarget(self, action: #selector(self.tapToPopupClose(_:)), for: .touchUpInside)*/
    }
}

//
//  NewEmailVC.swift
//  Whoop!
//
//  Created by Dilip Manek on 07/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

//MARK: - View Controller
class NewEmailVC: UIViewController, CustomToolBarDelegate {

    //Outlets
    @IBOutlet var btnSave: UIButton!
    @IBOutlet var txtFieldEmail: UITextField!
    @IBOutlet var imgViewEmail: UIImageView!
    @IBOutlet var lblUpdateEmail: UILabel!
    @IBOutlet var viewTxtFieldContainer: UIView!
    
    //Variables
    var toolBar : CustomToolBar = CustomToolBar.init(frame: CGRect(x: 0, y: 0, width: ScreenSize.WIDTH, height: 40),isSegment: false)
    
    //MARK: - Override Function
    override func viewDidLoad() {
        super.viewDidLoad()

        txtFieldEmail.setPlaceholderTextColor(color: UIColor(red: 153.00/255.00, green: 154.00/255.00, blue: 155.00/255.00, alpha: 1))
        txtFieldEmail.autocorrectionType = .no
        txtFieldEmail.inputAccessoryView = toolbarInit(textField: txtFieldEmail)
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
    
    
    //MARK: - Tapped Events
    @IBAction func tappedOnSaveBtn(_ sender: Any) {
        closeKeyBoard()
//        self.navigationController?.popViewController(animated: true)
        let initVC = self.storyboard?.instantiateViewController(withIdentifier: "EmailPasswordVC") as! EmailPasswordVC
        initVC.closeKeyBoard()
        self.navigationController?.popToViewController(initVC, animated:true)
        

    }
    
    
}

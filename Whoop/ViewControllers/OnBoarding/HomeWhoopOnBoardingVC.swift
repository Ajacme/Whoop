//
//  HomeWhoopOnBoardingVC.swift
//  Whoop!
//
//  Created by Dilip manek on 01/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

class HomeWhoopOnBoardingVC: UIViewController {

    @IBOutlet weak var imageTop: UIImageView!
    @IBOutlet weak var imageLeft: UIImageView!
    @IBOutlet weak var imageRight: UIImageView!
    @IBOutlet weak var imageBottom: UIImageView!
    var objCodePopUp = ViewForCodePopUp()
      var newImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         Verify or Join
         
         To finish unlocking your home's Whoop! Button we need to verify your address. Tap Unlock Now. If someone you live with has given your home's code tap Enter Code
         */
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            self.customChatView()
        })
        if newImage != nil{
            imageTop.image = newImage
        }
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.clear
    }
    // MARK:- Status Bar Set Light Content
    override var prefersStatusBarHidden: Bool {
        return false
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Click events..
    
    @IBAction func tapToPopupClose(_ sender: UIButton) {
        self.objCodePopUp.removeFromSuperview()
        self.objCodePopUp.Cons_ViewTop.constant = 1000        
    }
    @IBAction func tapToHomeWhoopButtonCode(_ sender: UIControl) {
        
        let objHomeWhoopBoardingVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeWhoopBoardingVC") as! HomeWhoopBoardingVC
        if newImage != nil{
            objHomeWhoopBoardingVC.newImage = newImage
        }
        self.navigationController?.pushViewController(objHomeWhoopBoardingVC, animated: true)
    }
    @IBAction func tapToEnterCode(_ sender: UIControl) {
        let objEnterCodeVCVC = self.storyboard?.instantiateViewController(withIdentifier: "EnterCodeVC") as! EnterCodeVC
        if newImage != nil{
            objEnterCodeVCVC.newImage = newImage
        }
        self.navigationController?.pushViewController(objEnterCodeVCVC, animated: true)
    }
    @IBAction func tapToChangeAddress(_ sender: UIButton) {
    }
    
    // MARK: - CustumeView Design For PopUp
    func customChatView()  {
        objCodePopUp = Bundle.main.loadNibNamed("ViewForCodePopUp", owner: self, options: nil)?.first as! ViewForCodePopUp
        self.objCodePopUp.frame = CGRect(x: 0, y:0, width:ScreenSize.WIDTH, height:ScreenSize.HEIGHT)
        
        objCodePopUp.lblTitle.textAlignment = NSTextAlignment.center
        objCodePopUp.lblTitle.text = "Verify or Join"
        objCodePopUp.lblDesc.text = "To finish unlocking your home's Whoop! Button we need to verify your address. Tap Unlock Now. If someone you live with has given your home's code tap Enter Code."
        
        
        objCodePopUp.backgroundColor = UIColor.clear
        self.view.addSubview(objCodePopUp)
        UIView.animate(withDuration: 0.5) {
            //self.objCodePopUp.alpha = 0.5
            self.objCodePopUp.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
            self.objCodePopUp.Cons_ViewTop.constant = 40
            self.view.layoutIfNeeded()
        }
        self.objCodePopUp.btnClose.addTarget(self, action: #selector(self.tapToPopupClose(_:)), for: .touchUpInside)
        self.objCodePopUp.btnCancel.addTarget(self, action: #selector(self.tapToPopupClose(_:)), for: .touchUpInside)
    }
}

//
//  BookedApointmentViewController.swift
//  Whoop
//
//  Created by ACMEUNIVERSE MAC-2 on 11/12/17.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit

class BookedApointmentViewController: UIViewController {

    @IBOutlet var lblMonday: UILabel!
    @IBOutlet var lblDateandMonth: UILabel!
    @IBOutlet var lblyear: UILabel!
    @IBOutlet var lblSlot: UILabel!
    
    var day = ""
    var year = ""
    var monthAndDate = ""
    var slot = ""
    
    var objCodePopUp = ViewForCodePopUp()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblMonday.text = day
        lblyear.text = year
        lblDateandMonth.text = monthAndDate
        lblSlot.text = slot
        
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Click Events
    @IBAction func tapSubmitData(_ sender: Any) {
        customChatView()
        
    }
    @IBAction func tapBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapToPopupClose(_ sender: UIButton) {
        
        self.objCodePopUp.removeFromSuperview()
        self.objCodePopUp.Cons_ViewTop.constant = 1000
        
        if let initVC = self.storyboard?.instantiateViewController(withIdentifier: "NewMessageCentreViewController") as? NewMessageCentreViewController{
            self.navigationController?.pushViewController(initVC, animated: true)
        }
    }
    
    
    // MARK: - CustumeView Design For PopUp
    func customChatView()  {
        
        objCodePopUp = Bundle.main.loadNibNamed("ViewForCodePopUp", owner: self, options: nil)?.first as! ViewForCodePopUp
        self.objCodePopUp.frame = CGRect(x: 0, y:0, width:ScreenSize.WIDTH, height:ScreenSize.HEIGHT)
        
//        objCodePopUp.lblTitle.textAlignment = NSTextAlignment.center
        
        objCodePopUp.lblTitle.text = "Booking pending"
        objCodePopUp.lblDesc.text = "Thanks for choosing to get a quote from your Whoop! tradesman.\nWe'll confirm the time slot right away."
        
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

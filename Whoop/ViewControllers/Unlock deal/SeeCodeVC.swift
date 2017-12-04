//
//  SeeCodeVC.swift
//  Whoop!
//
//  Created by Dilip manek on 08/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

//MARK: - Set Static See Code Data
class SeeCode_Data: NSObject {
    class func getData() -> [SeeCode_ModleData] {
        
        var data = [SeeCode_ModleData]()
        data.append(SeeCode_ModleData.init(SeeCode: "476Wtfgj5", ExpireDays: "21Days", isSeeCodeUsedBefore: false))
        data.append(SeeCode_ModleData.init(SeeCode: "591TlvC3", ExpireDays: "15Days", isSeeCodeUsedBefore: false))
        data.append(SeeCode_ModleData.init(SeeCode: "999gJaX1", ExpireDays: "9Days", isSeeCodeUsedBefore: false))
        
        return data
    }
}

//MARK: - ModleClass SeeCode
class SeeCode_ModleData :  NSObject {
    
    //Variable
    var SeeCode : String = ""
    var ExpireDays : String = ""
    var isSeeCodeUsedBefore: Bool = false
    
    override init() {
        
    }
    
    init(SeeCode: String, ExpireDays: String, isSeeCodeUsedBefore: Bool)
    {
        self.SeeCode = SeeCode
        self.ExpireDays = ExpireDays
        self.isSeeCodeUsedBefore = isSeeCodeUsedBefore
    }
}
class SeeCodeVC: UIViewController {

    @IBOutlet weak var lblExpireDays: MTLabel!
    @IBOutlet weak var lblCode: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Click Events..
    @IBAction func tapToUseCode(_ sender: UIControl) {
        
        if self.navigationController != nil{
            for vc in (self.navigationController?.viewControllers)!{
                if vc is WebDealDetailVC{
                    let vcontroll  :WebDealDetailVC = vc as! WebDealDetailVC
                    vcontroll.getSelectedCode(selectedCode: lblCode.text!)
                    break
                }
            }
        }
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func tapToBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

//
//  WebDealDetailVC.swift
//  Whoop!
//
//  Created by Dilip manek on 03/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

class Insurance_data :  NSObject {
    
    var title : String = ""
    var desc : String = ""
    var imageName : String = ""
    var UnlockedimageName : String = ""
    var isAddedSuper : Bool = false
    var isGetQuotes : Bool = false
    var selectedBGImage : String = ""
    var displayMessage : String = ""
    var lockText : String = ""
    var isLocked : Bool = false
    var bgImage : String = ""
    
    override init() {
        
    }
    
    init(title: String, desc: String, imageName: String, isLocked: Bool, isAddedSuper: Bool , UnlockedimageName :String,isGetQuotes: Bool, selectedBGImage : String,displayMessage : String, lockText : String,bgImage : String)
    {
        self.title = title
        self.desc = desc
        self.imageName = imageName
        self.isAddedSuper = isAddedSuper
        self.UnlockedimageName = UnlockedimageName
        self.isGetQuotes = isGetQuotes
        self.displayMessage = displayMessage
        self.lockText = lockText
        self.selectedBGImage = selectedBGImage
        self.isLocked = isLocked
        self.bgImage = bgImage
    }
}

class CellForTickets: UITableViewCell {
    @IBOutlet weak var cntrolTapImage: UIControl!
    @IBOutlet weak var cntrolAddDeal: UIControl!
    @IBOutlet weak var lblMainTitle: UILabel!
    @IBOutlet weak var lblTapUnlock: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblLocked: UILabel!
    @IBOutlet weak var viewForBack: UIView!
    @IBOutlet weak var imgTopBG: UIImageView!
    @IBOutlet weak var imgMiddleblue: UIImageView!
    @IBOutlet weak var lblUnlockText: UILabel!
    @IBOutlet weak var lblUnlockBy: UILabel!
    @IBOutlet weak var cons_LockedLeading: NSLayoutConstraint!
    @IBOutlet weak var imgUnlock: UIImageView!
    
    @IBOutlet weak var btnMeetYourPlumber: UIButton!
    @IBOutlet weak var btnTopIcon: UIButton!
    @IBOutlet weak var lblUsesCredit: UILabel!
    @IBOutlet weak var lblDealBoosted: UILabel!
    @IBOutlet weak var lblGetQuotes: UILabel!
    var pulseEffect : PulsingHaloLayer!
    
}

class SuperWhoopDetailVC: UIViewController {
    
    @IBOutlet weak var tableViewMain: UITableView!
    @IBOutlet weak var viewForHeader: UIView!
    @IBOutlet weak var cons_tablHeight: NSLayoutConstraint!
    var objCodePopUp = SuperWhoopPopUp()
    @IBOutlet weak var lblHeaderTitle: MTLabel!
    @IBOutlet weak var lblHeaderSubDesc: MTLabel!
    @IBOutlet weak var cons_lblHeaderMiddle: NSLayoutConstraint!

    var arrScrollData = [[String : Any]]()
    var  arrInsuranceData = [Insurance_data]()
    var pulseEffect:PulsingHaloLayer!
    var addedDeal = 1
    @objc var scrollTimer:Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewMain.estimatedRowHeight = 401
        viewForHeader.frame = CGRect(x: 0, y: 0, width: ScreenSize.WIDTH, height: 90)
        tableViewMain.tableHeaderView = viewForHeader

        
        /*
 
         dic1.updateValue("true", forKey: "isLock")
         dic1.updateValue("", forKey: "displayMessage")
         dic1.updateValue("true", forKey: "isAddedSuper")
         dic1.updateValue("", forKey: "desc")
         
         dic1.updateValue("Jakie Hughes", forKey: "title")
         dic1.updateValue("add_yourself", forKey: "imageName")
         dic1.updateValue("Is now Added", forKey: "lockText")
    */
        arrScrollData  = [
            ["imageName" : "blue-travel-insurance","title" : "Travel Insurance deal".localized,"desc":"This deal is unlocked. Add yourself to \nunlock an extra saving if you use it in the future".localized,"displayMessage" : "Expires in 45 days".localized, "isAddedSuper" : true, "lockText" : "Unlocked", "isLock":"true"],
            
            ["imageName" : "add_yourself","title" : "Jakie Hughes".localized,"desc":"", "displayMessage" : "", "isAddedSuper" : true, "lockText" : "Is now Added", "isLock":"true"],
            
            ["imageName" : "add","title" : "Add Yourself".localized,"desc":"Tap + to add yourself ".localized, "displayMessage" : "Expires in 45 days".localized, "isAddedSuper" : false, "lockText" : "Not Added", "isLock":"false"]]
        tableViewMain.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.new, context: nil)
        
        for dic in arrScrollData
        {
            let tableData = Insurance_data()
            tableData.title = dic["title"] as! String
            tableData.imageName = dic["imageName"] as! String
            tableData.desc = dic["desc"] as! String
            tableData.isAddedSuper = dic["isAddedSuper"] as! Bool
            tableData.displayMessage = dic["displayMessage"] as! String
            tableData.lockText = dic["lockText"] as! String
           // tableData.UnlockedimageName = dic["selected_image"] as! String
            arrInsuranceData.append(tableData)
        }
        self.tabBarController?.tabBar.isHidden = true
    }
    // MARK: - Set people collection view Height Observer
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        cons_tablHeight.constant = max(tableViewMain.contentSize.height,self.view.frame.size.height)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Get Selected Deal....
    func getSelectedCode(selectedDealData : Insurance_data , selectedIndex : Int) {
        addedDeal += 1
        arrInsuranceData.remove(at: selectedIndex)
        arrInsuranceData.insert(selectedDealData, at: selectedIndex)
        self.tableViewMain.reloadData()
        
        if addedDeal == arrInsuranceData.count
        {
            cons_lblHeaderMiddle.constant = 10
            self.lblHeaderTitle.text = "Your unlocked deals. Upgrade\none to a Super Whoop! Deal"
            self.lblHeaderSubDesc.text = ""
        }
        self.rippleEffectMethod()
    }
    
    //MARK: - on add clicked
   
    @IBAction func tapToAddYourSelf(_ sender: UIControl) {
        
        let buttonPosition = (sender as AnyObject).convert(CGPoint.zero, to: self.tableViewMain)
        let indexPath = self.tableViewMain.indexPathForRow(at: buttonPosition)
        
        let cell = self.tableViewMain.cellForRow(at: indexPath!) as! CellForTickets
        
        let dict = arrScrollData[(indexPath?.row)!]//arrInsuranceData[(indexPath?.row)!]
//        "isLock":"false"
        let strislock = dict["isLock"] as? String
        
        if strislock == "false" {
            if self.pulseEffect != nil {
                self.pulseEffect.removeFromSuperlayer()
            }
            
            self.pulseEffect = PulsingHaloLayer()
            self.pulseEffect.haloLayerNumber = 7
            self.pulseEffect.animationDuration = 3
            self.pulseEffect.radius = 125.0
            self.pulseEffect.backgroundColor = UIColor.init(red: 255/255.0, green: 79/255.0, blue: 0/255.0, alpha: 1.0).cgColor
            self.pulseEffect.position = cell.imgMiddleblue.center
            cell.imgMiddleblue.layer.addSublayer(self.pulseEffect)
            
            self.pulseEffect.start()
            cell.imgTopBG.backgroundColor = UIColor(red: 141.0 / 255.0, green: 142.0 / 255.0, blue: 143.0 / 255.0, alpha: 1.0)
            
            //compressed animation
            UIView.animate(withDuration: 0.6,
                           animations: {
                            cell.cntrolTapImage.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            },
                           completion: { _ in
                            UIView.animate(withDuration: 0.6) {
                                cell.cntrolTapImage.transform = CGAffineTransform.identity
                                
                                //ripple animation
                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                                    UIView.animate(withDuration: 1.5, animations: {
                                        
                                        var dic1 = self.arrScrollData[(indexPath?.row)!]
                                        dic1.updateValue("true", forKey: "isLock")
                                        dic1.updateValue("", forKey: "displayMessage")
                                        dic1.updateValue("true", forKey: "isAddedSuper")
                                        dic1.updateValue("", forKey: "desc")
                                
                                        dic1.updateValue("", forKey: "title")
                                        dic1.updateValue("rightArrow", forKey: "imageName")
                                        dic1.updateValue("You have Added yourself", forKey: "lockText")
                                        
                                        
                                        /*if indexPath?.row == 1 {
                                            dic1.updateValue("Jakie Hughes", forKey: "title")
                                            dic1.updateValue("add_yourself", forKey: "imageName")
                                            dic1.updateValue("Is now Added", forKey: "lockText")
                                        }else{
                                            dic1.updateValue("", forKey: "title")
                                            dic1.updateValue("rightArrow", forKey: "imageName")
                                            dic1.updateValue("You have Added yourself", forKey: "lockText")
                                        }*/
                                       
                                        self.addedDeal += 1
                                        self.arrScrollData .remove(at: (indexPath?.row)!)
                                        self.arrScrollData.insert(dic1, at: (indexPath?.row)!)
                                        self.pulseEffect.backgroundColor = UIColor.init(red: 255/255.0, green: 79/255.0, blue: 0/255.0, alpha: 1.0).cgColor
                                        
                                        self.tableViewMain.reloadData()
                                        
                                        if self.addedDeal == self.arrScrollData.count
                                        {
                                            self.cons_lblHeaderMiddle.constant = 10
                                            self.lblHeaderTitle.text = "Your unlocked deals. Upgrade\none to a Super Whoop! Deal"
                                            self.lblHeaderSubDesc.text = ""
                                             self.setInLastFullTheme()
                                        }
//                                        self.rippleEffectMethod()
                                        
                                    }, completion: { (result) in
                                        self.pulseEffect.removeFromSuperlayer()
                                    })
                                }
                            }
            })
            
            
        }
    
    }
    /*@IBAction func tapToAddYourSelf(_ sender: Any) {
        
        print("add clicked")
        
        let dict = arrInsuranceData[sender.tag]
        dict.displayMessage = "Tap to  unlock".localized
        dict.isAddedSuper = true
        
        self.rippleEffectMethod()
    }*/
    //MARK: - Click Events....
    @IBAction func tapToMiddleImage(_ sender: UIControl) {
        
    }
    @IBAction func tapToBack(_ sender: UIControl) {
        print("pop here")
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func tapToAddDeal(_ sender: UIControl) {
        //AddSuperWhoopVC
    }
    @IBAction func tapToClosePopUp(_ sender: UIButton) {
        self.objCodePopUp.removeFromSuperview()
        self.objCodePopUp.Cons_ViewMiddle.constant = 1000
    }

    //MARK: - Ripple Effect Method....
    func rippleEffectMethod() {
        
        for i in 0..<arrInsuranceData.count
        {
               let indexPath = IndexPath(row: i, section: 0)
                let cell = tableViewMain.cellForRow(at: indexPath) as! CellForTickets
                cell.pulseEffect = PulsingHaloLayer()
                cell.pulseEffect.haloLayerNumber = 7
                cell.pulseEffect.animationDuration = 3
                cell.pulseEffect.radius = 125.0
                cell.pulseEffect.backgroundColor = UIColor.init(red: 75/255.0, green: 166/255.0, blue: 249/255.0, alpha: 1.0).cgColor
                cell.pulseEffect.position = cell.cntrolTapImage.center
                cell.viewForBack.layer.addSublayer(cell.pulseEffect)
                cell.pulseEffect.start()
                cell.imgTopBG.backgroundColor = UIColor(red: 141.0 / 255.0, green: 142.0 / 255.0, blue: 143.0 / 255.0, alpha: 1.0)
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            for i in 0..<self.arrInsuranceData.count
            {
                let indexPath = IndexPath(row: i, section: 0)
                let cell = self.tableViewMain.cellForRow(at: indexPath) as! CellForTickets
                cell.pulseEffect.removeFromSuperlayer()
            }
            if self.addedDeal == self.arrInsuranceData.count {
                self.setInLastFullTheme()
            }
            self.addedDeal += 1
            
        }
    }
    func setInLastFullTheme() {
        
        for i in 0..<arrInsuranceData.count
        {
            let indexPath = IndexPath(row: i, section: 0)
            let cell = tableViewMain.cellForRow(at: indexPath) as! CellForTickets
            cell.imgTopBG.image = UIImage(named:"orange_bg")
            let dic = arrInsuranceData[i]
            dic.imageName = "orange_bg"
            cell.lblUnlockText.isHidden = false
            cell.lblUnlockBy.isHidden = true

        }
        self.customCodeView()
    }
    
    // MARK: - CustumeView Design For PopUp
    func customCodeView()  {
        objCodePopUp = Bundle.main.loadNibNamed("SuperWhoopPopUp", owner: self, options: nil)?.first as! SuperWhoopPopUp
        self.objCodePopUp.frame = CGRect(x: 0, y:89, width:ScreenSize.WIDTH, height:ScreenSize.HEIGHT - 89)
        objCodePopUp.backgroundColor = UIColor.clear
        self.view.addSubview(objCodePopUp)
        UIView.animate(withDuration: 0.5) {
            //self.objCodePopUp.alpha = 0.5
            self.objCodePopUp.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
            self.objCodePopUp.Cons_ViewMiddle.constant = 0
            self.view.layoutIfNeeded()
        }
        
        //Buttons Click Events..
        self.objCodePopUp.btnClose.addTarget(self, action: #selector(self.tapToClosePopUp(_:)), for: .touchUpInside)
        self.objCodePopUp.btnCross.addTarget(self, action: #selector(self.tapToClosePopUp(_:)), for: .touchUpInside)
    }
}
//MARK: - Tableview Delegates And Datasource

extension SuperWhoopDetailVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return arrInsuranceData.count
        return arrScrollData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellForTickets") as! CellForTickets
        let dic = arrScrollData[indexPath.row]
        cell.cntrolTapImage.tag = indexPath.row
        cell.lblMainTitle.text = dic["title"] as! String//dic.title
        cell.lblDesc.text = dic["desc"] as! String
        cell.cntrolAddDeal.tag = indexPath.row
        cell.lblTapUnlock.text = dic["displayMessage"] as! String
        cell.lblUnlockBy.isHidden = true
        cell.lblUnlockText.isHidden = true
        cell.lblLocked.text = dic["lockText"] as! String
        
        let strislock = dic["isLock"] as! String
        if strislock == "true"
        {
            self.setCellcolorAndImage(cell: cell, dic: dic)
            
        }else{
            cell.imgMiddleblue.image = UIImage(named: dic["imageName"] as! String)
            cell.lblTapUnlock.text = ""
            cell.lblLocked.text = dic["lockText"] as! String//"Not Added".localized
            cell.imgTopBG.image = nil
            cell.imgTopBG.backgroundColor = UIColor(red: 141.0 / 255.0, green: 142.0 / 255.0, blue: 143.0 / 255.0, alpha: 1.0)
            cell.cntrolTapImage.isUserInteractionEnabled = true
//            cell.lblUnlockText.isHidden = false
//            cell.lblUnlockBy.isHidden = true
            
        }
        return cell
    }
    
    func setCellcolorAndImage(cell : CellForTickets ,dic : [String : Any]) {
        cell.imgMiddleblue.image = UIImage(named: dic["imageName"] as! String)
        cell.lblLocked.text = dic["lockText"] as! String//"Unlocked".localized
        cell.lblTapUnlock.text = dic["displayMessage"] as! String
        cell.imgTopBG.backgroundColor = UIColor.clear
        cell.imgTopBG.image = UIImage(named:"bg")
        cell.cntrolTapImage.isUserInteractionEnabled = false
    }
   
}

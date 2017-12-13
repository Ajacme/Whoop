//
//  QuoteViewController.swift
//  Whoop
//
//  Created by ACME_MAC_SSD on 12/11/17.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController {
   
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var objCodePopUp = SuperWhoopPopUp()
    
    var arrScrollData = [[String : Any]]()
    var  arrInsuranceData = [Insurance_data]()
    var pulseEffect:PulsingHaloLayer!
    var addedDeal = 1
    let defaults:UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        headerView.frame = CGRect(x: 0, y: 0, width: ScreenSize.WIDTH, height: 90)
        tableView.tableHeaderView = headerView

        
        arrScrollData  = [
            ["imageName" : "plumber_profile", "selected_image" :"plumber_profile", "title" : "Normal price".localized,"desc":"Scroll down and tap your Whoop! Button to see your Whoop! Me Happry price.".localized,"displayMessage" : "£575.00".localized, "isAddedSuper" : true, "isLock":"true", "bgImage" : "bg_tra", "lockText": "Boiler repair", "totalSaving": ""],
        
            ["imageName" : "whoop-btn", "selected_image" :"whoop-btn", "title" : "Your Whoop! Me Happy price".localized,"desc":"Tap your button to see your Whoop! Me Happy price".localized,"displayMessage" : "".localized, "isAddedSuper" : false, "lockText" : "", "isLock":"false", "bgImage" : "bg_tra","totalSaving": ""]
        ]
//        tableView.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.new, context: nil)
        
        for dic in arrScrollData
        {
            let tableData = Insurance_data()
            tableData.title = dic["title"] as! String
            tableData.imageName = dic["imageName"] as! String
            tableData.desc = dic["desc"] as! String
            tableData.isAddedSuper = dic["isAddedSuper"] as! Bool
            tableData.displayMessage = dic["displayMessage"] as! String
            tableData.lockText = dic["lockText"] as! String
            
            tableData.UnlockedimageName = dic["selected_image"] as! String
//            tableData.price = dic["price"] as! String
//            tableData.numberOfDealLeft = dic["numberOfDealLeft"] as! String
            tableData.bgImage = dic["bgImage"] as! String
            
            
            // tableData.UnlockedimageName = dic["selected_image"] as! String
            arrInsuranceData.append(tableData)
            defaults.set(false, forKey: "isAccepted")
        }
        
    }
    
    @objc func tapToAcceptDeal(sender : UIButton){
        self.customCodeView(title: "Thank You!", desc: "We’ll contact you very soon to book in a convenient start date/time.")
        defaults.set(true, forKey: "isAccepted")
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func whoopButtonTapped(_ sender: Any) {
        let buttonPosition = (sender as AnyObject).convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at: buttonPosition)
        
        let cell = self.tableView.cellForRow(at: indexPath!) as! CellForTickets
        
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
            
            //compressed animation
            UIView.animate(withDuration: 0.4,
                           animations: {
                            cell.btnWhoop.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            },
                           completion: { _ in
                            UIView.animate(withDuration: 0.4) {
                                cell.btnWhoop.transform = CGAffineTransform.identity
                                
                                //ripple animation
                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                                    UIView.animate(withDuration: 0.1, animations: {
                                        
                                        var dic1 = self.arrScrollData[(indexPath?.row)!]
                                        dic1.updateValue("true", forKey: "isLock")
                                        dic1.updateValue("£475.00", forKey: "displayMessage")
                                        dic1.updateValue("£100 saved!", forKey: "totalSaving")
                                        dic1.updateValue("true", forKey: "isAddedSuper")
                                        
                                         self.pulseEffect.backgroundColor = UIColor.init(red: 255/255.0, green: 79/255.0, blue: 0/255.0, alpha: 1.0).cgColor
                                        
                                        self.arrScrollData .remove(at: (indexPath?.row)!)
                                        self.arrScrollData.insert(dic1, at: (indexPath?.row)!)
//                                         self.tableView.reloadRows(at: [indexPath!], with: .bottom)
                                       
                                        self.tableView.beginUpdates()
                                        self.tableView.reloadData()
                                        self.tableView.endUpdates()
                                 
                                        
                                    }, completion: { (result) in
                                        self.pulseEffect.removeFromSuperlayer()
                                    })
                                }
                            }
            })
            
        }
        
    }
    @IBAction func tapToClosePopUp(_ sender: UIButton) {
        self.objCodePopUp.removeFromSuperview()
        self.objCodePopUp.Cons_ViewMiddle.constant = 1000
        
        let accepted:Bool = defaults.bool(forKey: "isAccepted" )
        if accepted {
            
            let buttonPosition = (sender as AnyObject).convert(CGPoint.zero, to: self.tableView)
            let indexPath = self.tableView.indexPathForRow(at: buttonPosition)
            
            let cell = self.tableView.cellForRow(at: indexPath!) as! CellForTickets
            let button = cell.viewWithTag(11) as? UIButton
            button?.isUserInteractionEnabled = false
            button?.setTitleColor(UIColor(red: 141.0/255.0, green: 142.0/255.0, blue: 143.0/255.0, alpha: 1.0), for: .normal)
            defaults.set(false, forKey: "isAccepted")
            
        }
    }
    
    // MARK: - CustumeView Design For PopUp
    func customCodeView(title: String, desc: String)  {
        objCodePopUp = Bundle.main.loadNibNamed("SuperWhoopPopUp", owner: self, options: nil)?.first as! SuperWhoopPopUp
        self.objCodePopUp.frame = CGRect(x: 0, y:89, width:ScreenSize.WIDTH, height:ScreenSize.HEIGHT - 89)
        
        objCodePopUp.labelTitle.text = title//"Job description"
        objCodePopUp.labelDiscription.text = desc//"We'll replace or fix your boiler. If necessary we'll take your old boiler away too."
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
   
    @objc func jobInfoClicked(sender: UIButton){
        
        self.customCodeView(title: "Job description", desc: "We'll replace or fix your boiler. If necessary we'll take your old boiler away too.")
    }
    @IBAction func tapBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapToSeeWhoopPrice(_ sender: Any) {
        
        
    }
}

//MARK: - Tableview Delegates And Datasource

extension QuoteViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return arrInsuranceData.count
        return arrScrollData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CellForTickets
        let dic = arrScrollData[indexPath.row]
        cell.cntrolTapImage.tag = indexPath.row
        cell.lblMainTitle.text = dic["title"] as? String//dic.title
        cell.lblDesc.text = (dic["desc"] as? String)
        cell.lblTapUnlock.text = (dic["displayMessage"] as! String)
        cell.lblLocked.text = dic["lockText"] as? String
        cell.btnJobInfo.tag = indexPath.row
        cell.btnJobInfo.addTarget(self, action: #selector(QuoteViewController.jobInfoClicked(sender:)), for: .touchUpInside)
    
        let strislock = dic["isLock"] as! String
        
        if indexPath.row == 0 {
            cell.lockTextTopConstraint.isActive = true
            cell.btnJobInfo.isHidden = false
            cell.bottomViewHeightConstraint.constant = 70
             cell.seeJobInfoHeightConstraint.constant = 21
            
        }else{
            
            cell.btnJobInfo.isHidden = true
            cell.bottomViewHeightConstraint.constant = 50
            
            let button:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 10, height: 50))//UIButton(frame:
            button.backgroundColor = UIColor.clear
//            button.backgroundColor = .clear
            button.titleLabel?.font =  UIFont(name: "Lato-Semibold", size: 20)
            button.setTitle("Accept", for: .normal)
            button.tag = 11
//            button.titleLabel?.textAlignment = .center//NSTextAlignment.Center
            button.setTitleColor(UIColor(red: 253.0/255.0, green: 86.0/255.0, blue: 18.0/255.0, alpha: 1.0), for: .normal)
            button.addTarget(self, action: #selector(QuoteViewController.tapToAcceptDeal(sender:)), for: .touchUpInside)

            cell.cntrolAddDeal.addSubview(button)
            
            cell.lblUnlockText.text = ""
            cell.lblUnlockBy.text = ""
            cell.btnWhoop.isHidden = false
            cell.btnWhoop.isUserInteractionEnabled = true
//            cell.lblLocked.text = "Accept"
            cell.lblTotalSaving.text = dic["totalSaving"] as? String
        }
        if strislock == "true"
        {
            self.setCellcolorAndImage(cell: cell, dic: dic)
            
        }else{
            cell.imgMiddleblue.image = UIImage(named: dic["imageName"] as! String)
            cell.lblTapUnlock.text = ""
            cell.lblLocked.text = dic["lockText"] as? String//"Not Added".localized
//            cell.imgTopBG.image = UIImage(named : dic["bgImage"] as! String)
            cell.imgTopBG.image = nil
            cell.cntrolTapImage.isUserInteractionEnabled = true
            cell.imgTopBG.backgroundColor = UIColor(red: 141.0 / 255.0, green: 142.0 / 255.0, blue: 143.0 / 255.0, alpha: 1.0)
            
        }
        return cell
    }
    
    func setCellcolorAndImage(cell : CellForTickets ,dic : [String : Any]) {
        cell.imgMiddleblue.image = UIImage(named: (dic["imageName"] as? String)!)
        cell.lblLocked.text = dic["lockText"] as? String//"Unlocked".localized
        cell.lblTapUnlock.text = dic["displayMessage"] as? String
//        cell.imgTopBG.backgroundColor = UIColor.clear
        cell.imgTopBG.image = UIImage(named:"bg_tra")
        cell.cntrolTapImage.isUserInteractionEnabled = false
    }
    
}

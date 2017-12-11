//
//  QuoteViewController.swift
//  Whoop
//
//  Created by ACME_MAC_SSD on 12/11/17.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController {
    @IBOutlet var headerView: UnlockHeaderView!
    @IBOutlet weak var tableView: UITableView!
    
    
    var arrScrollData = [[String : Any]]()
    var  arrInsuranceData = [Insurance_data]()
    var pulseEffect:PulsingHaloLayer!
    var addedDeal = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        /*
 
         ["image" : "blue_plane","selected_image" :"gray_plane","title" : "Travel Insurance".localized,"desc":"This is your home's travel insurance deal".localized, "bgImage" : "bg"],
 */
        /*
 
         ["imageName" : "add","title" : "Add Yourself".localized,"desc":"Tap + to add yourself ".localized, "displayMessage" : "Expires in 45 days".localized, "isAddedSuper" : false, "lockText" : "Not Added", "isLock":"false"]
 */
        arrScrollData  = [
            ["imageName" : "plumber_profile", "selected_image" :"plumber_profile", "title" : "Jake Hughes, your plumber".localized,"desc":"Here's the normal price. Tap to your Whoop! Button to reveal the Whoop! Me Happy price".localized,"displayMessage" : "Boiler repair".localized, "isAddedSuper" : true, "lockText" : "Whoop! Me Happy deals left", "isLock":"true", "price":"£578.00 normal price", "numberOfDealLeft":"103", "bgImage" : "bg_tra"],
        
            ["imageName" : "whoop-btn", "selected_image" :"whoop-btn", "title" : "Your Whoop! Me Happy price".localized,"desc":"Tap your button to see your Whoop! Me Happy price".localized,"displayMessage" : "".localized, "isAddedSuper" : false, "lockText" : "", "isLock":"false", "price":"", "numberOfDealLeft":"Accept", "bgImage" : "bg_tra"]
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
            tableData.price = dic["price"] as! String
            tableData.numberOfDealLeft = dic["numberOfDealLeft"] as! String
            tableData.bgImage = dic["bgImage"] as! String
            
            
            // tableData.UnlockedimageName = dic["selected_image"] as! String
            arrInsuranceData.append(tableData)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func tapBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapToSeeWhoopPrice(_ sender: Any) {
        
        
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
            
//            self.pulseEffect = PulsingHaloLayer()
//            self.pulseEffect.haloLayerNumber = 7
//            self.pulseEffect.animationDuration = 3
//            self.pulseEffect.radius = 125.0
//            self.pulseEffect.backgroundColor = UIColor.init(red: 255/255.0, green: 79/255.0, blue: 0/255.0, alpha: 1.0).cgColor
//            self.pulseEffect.position = cell.imgMiddleblue.center
//            cell.imgMiddleblue.layer.addSublayer(self.pulseEffect)
//
//            self.pulseEffect.start()
//            cell.imgTopBG.backgroundColor = UIColor(red: 141.0 / 255.0, green: 142.0 / 255.0, blue: 143.0 / 255.0, alpha: 1.0)
            
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
                                        dic1.updateValue("£100 saved!", forKey: "displayMessage")
                                        dic1.updateValue("true", forKey: "isAddedSuper")
                                        dic1.updateValue("£475.00", forKey: "price")
                                        
                                        /*if indexPath?.row == 1 {
                                         dic1.updateValue("Jakie Hughes", forKey: "title")
                                         dic1.updateValue("add_yourself", forKey: "imageName")
                                         dic1.updateValue("Is now Added", forKey: "lockText")
                                         }else{
                                         dic1.updateValue("", forKey: "title")
                                         dic1.updateValue("rightArrow", forKey: "imageName")
                                         dic1.updateValue("You have Added yourself", forKey: "lockText")
                                         }*/
                                        
//                                        self.addedDeal += 1
                                        self.arrScrollData .remove(at: (indexPath?.row)!)
                                        self.arrScrollData.insert(dic1, at: (indexPath?.row)!)
//                                        self.pulseEffect.backgroundColor = UIColor.init(red: 255/255.0, green: 79/255.0, blue: 0/255.0, alpha: 1.0).cgColor
                                        
                                        self.tableView.reloadData()
                                        
//                                        if self.addedDeal == self.arrScrollData.count
//                                        {
//                                            self.cons_lblHeaderMiddle.constant = 10
//                                            self.lblHeaderTitle.text = "Your unlocked deals. Upgrade\none to a Super Whoop! Deal"
//                                            self.lblHeaderSubDesc.text = ""
//                                            self.setInLastFullTheme()
//                                        }
                                        //                                        self.rippleEffectMethod()
                                        
                                    }, completion: { (result) in
//                                        self.pulseEffect.removeFromSuperlayer()
                                    })
                                }
                            }
            })
            
            
        }
        
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
        cell.lblMainTitle.text = dic["title"] as! String//dic.title
        cell.lblDesc.text = dic["desc"] as! String
//        cell.cntrolAddDeal.tag = indexPath.row
        cell.lblTapUnlock.text = dic["displayMessage"] as! String
//        cell.lblUnlockBy.isHidden = true
//        cell.lblUnlockText.isHidden = true
        cell.lblLocked.text = dic["lockText"] as! String
        cell.lblPrice.text = dic["price"] as! String
        cell.lblNumberOfDeals.text = dic["numberOfDealLeft"] as! String
        cell.btnJobInfo.tag = indexPath.row
        
    
        let strislock = dic["isLock"] as! String
        if strislock == "true"
        {
            self.setCellcolorAndImage(cell: cell, dic: dic)
            
        }else{
            cell.imgMiddleblue.image = UIImage(named: dic["imageName"] as! String)
            cell.lblTapUnlock.text = ""
            cell.lblLocked.text = dic["lockText"] as! String//"Not Added".localized
            cell.imgTopBG.image = UIImage(named : dic["bgImage"] as! String)
//            cell.imgTopBG.backgroundColor = UIColor(red: 141.0 / 255.0, green: 142.0 / 255.0, blue: 143.0 / 255.0, alpha: 1.0)
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
//        cell.imgTopBG.backgroundColor = UIColor.clear
        cell.imgTopBG.image = UIImage(named:"bg_tra")
        cell.cntrolTapImage.isUserInteractionEnabled = false
    }
    
}

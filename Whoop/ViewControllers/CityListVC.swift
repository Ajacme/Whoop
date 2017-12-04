//
//  CityListVC.swift
//  Whoop!
//
//  Created by Maulik Vinodbhai Vora on 18/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

//MARK: - UITableViewCell Class
class tblCityListCellVC: UITableViewCell
{
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblDesc: UILabel!
    
    @IBOutlet weak var img_bg: UIImageView!
    
    @IBOutlet weak var viewLogo_background: UIControl!
    @IBOutlet weak var img_logo: UIImageView!
    
    @IBOutlet weak var btntblCellLogo: UIButton!
    @IBOutlet weak var valueLabel: UILabel!
    
}

class CityListVC: UIViewController {
    
    @IBOutlet weak var tblDataList: UITableView!
    
    //tblHeader
    @IBOutlet var viewtblHeader: UIView!
    @IBOutlet weak var img_bg: UIImageView!
    @IBOutlet weak var viewLogo_background: UIControl!
    @IBOutlet weak var img_Logo: UIImageView!
    @IBOutlet weak var imgTitle: UILabel!
    @IBOutlet var headerValueLabel: UILabel!
    var objCodePopUp = SuperWhoopPopUp()
    
    //alloc tablelist array
    var arrtblData = [[String : Any]]()
    
    var pulseEffect:PulsingHaloLayer!
    var is_selected = NSString()
    
    @IBOutlet weak var btntblheader_imglogo: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        is_selected = "No"
        
        //add tableview header
        tblDataList.tableHeaderView = viewtblHeader
        
        //settblListData
        arrtblData  = [["image" : "whoop-btn","image_bg" : "london","selected_image" :"whoop-btn-final","title" : "London","Desc":"Tap our button and get an extra Super Whoop! Deal next month","isLock":"true"],["image" : "whoop-btn","image_bg" : "Birmingham","selected_image" :"whoop-btn-final","title" : "Birmingham","Desc":"Tap our button and get an extra Super Whoop! Deal next month","isLock":"true"]]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //button click event
    @IBAction func btntblheader_imgLogo(_ sender: Any) {
        if is_selected == "No" {
            if self.pulseEffect != nil {
                self.pulseEffect.removeFromSuperlayer()
            }
//            let buttonPosition = (sender as AnyObject).convert(CGPoint.zero, to: self.tblDataList)
//            let indexPath = self.tblDataList.indexPathForRow(at: buttonPosition)
//
//            let cell = self.tblDataList.cellForRow(at: indexPath!) as! tblCityListCellVC
//
//            cell.valueLabel.textColor = UIColor(red: 162.0/255.0, green: 160.0/255.0, blue: 160.0/255.0, alpha: 1.0)
            
            self.pulseEffect = PulsingHaloLayer()
            self.pulseEffect.haloLayerNumber = 7
            self.pulseEffect.animationDuration = 3
            self.pulseEffect.radius = 125.0
            self.pulseEffect.backgroundColor = UIColor.init(red: 255/255.0, green: 79/255.0, blue: 0/255.0, alpha: 1.0).cgColor
            self.pulseEffect.position = self.img_Logo.center
            self.img_Logo.layer.addSublayer(self.pulseEffect)
            self.pulseEffect.start()
            self.headerValueLabel.textColor = UIColor(red: 162.0/255.0, green: 160.0/255.0, blue: 160.0/255.0, alpha: 1.0)
            //compressed animation
            UIView.animate(withDuration: 0.6,
                           animations: {
                            self.btntblheader_imglogo.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            },
                           completion: { _ in
                            UIView.animate(withDuration: 0.6) {
                                self.btntblheader_imglogo.transform = CGAffineTransform.identity
                                
                                //ripple animation
                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                                    UIView.animate(withDuration: 1.5, animations: {
                                        self.is_selected = "Yes"
                                        self.btntblheader_imglogo.isHidden=true
                                        self.img_Logo.image = UIImage.init(named: "whoop-btn-final")
                                        self.pulseEffect.backgroundColor = UIColor.init(red: 255/255.0, green: 79/255.0, blue: 0/255.0, alpha: 1.0).cgColor
                                        self.tblDataList.reloadData()
                                    }, completion: { (result) in
                                        self.pulseEffect.removeFromSuperlayer()
                                        self.customCodeView()
                                    })
                                }
                                
                                
                            }
            })
            
            
        }
        
    }
    
    //tbl cell button action
    @IBAction func btntblCellLogo(_ sender: Any)
    {
        let buttonPosition = (sender as AnyObject).convert(CGPoint.zero, to: self.tblDataList)
        let indexPath = self.tblDataList.indexPathForRow(at: buttonPosition)
        
        let cell = self.tblDataList.cellForRow(at: indexPath!) as! tblCityListCellVC
        
        let dic = arrtblData[(indexPath?.row)!]
        let strislock = dic["isLock"] as? String
        if strislock == "false"
        {
            if self.pulseEffect != nil {
                self.pulseEffect.removeFromSuperlayer()
            }
            self.pulseEffect = PulsingHaloLayer()
            self.pulseEffect.haloLayerNumber = 7
            self.pulseEffect.animationDuration = 3
            self.pulseEffect.radius = 125.0
            self.pulseEffect.backgroundColor = UIColor.init(red: 255/255.0, green: 79/255.0, blue: 0/255.0, alpha: 1.0).cgColor
            self.pulseEffect.position = cell.img_logo.center
            cell.img_logo.layer.addSublayer(self.pulseEffect)
            self.pulseEffect.start()
            
            //compressed animation
            UIView.animate(withDuration: 0.6,
                           animations: {
                            cell.btntblCellLogo.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            },
                           completion: { _ in
                            UIView.animate(withDuration: 0.6) {
                                cell.btntblCellLogo.transform = CGAffineTransform.identity
                                
                                //ripple animation
                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                                    UIView.animate(withDuration: 1.5, animations: {
                                        
                                        var dic1 = self.arrtblData[(indexPath?.row)!]
                                        dic1.updateValue("true", forKey: "isLock")
                                        self.arrtblData .remove(at: (indexPath?.row)!)
                                        self.arrtblData.insert(dic1, at: (indexPath?.row)!)
                                        self.pulseEffect.backgroundColor = UIColor.init(red: 255/255.0, green: 79/255.0, blue: 0/255.0, alpha: 1.0).cgColor
                                        self.tblDataList.reloadData()
                                    }, completion: { (result) in
                                        self.pulseEffect.removeFromSuperlayer()
                                    })
                                }
                            }
            })
        }
        
    }
    // MARK: - CustumeView Design For PopUp
    func customCodeView()  {
        objCodePopUp = Bundle.main.loadNibNamed("SuperWhoopPopUp", owner: self, options: nil)?.first as! SuperWhoopPopUp
        self.objCodePopUp.frame = CGRect(x: 0, y:89, width:ScreenSize.WIDTH, height:ScreenSize.HEIGHT - 89)
        objCodePopUp.backgroundColor = UIColor.clear
        objCodePopUp.labelTitle.text = "You've tapped!"
        objCodePopUp.labelDiscription.text = "Your city is ready to Whoop! You Happy. A boost code has been added."
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
    @IBAction func tapToClosePopUp(_ sender: UIButton) {
        self.objCodePopUp.removeFromSuperview()
        self.objCodePopUp.Cons_ViewMiddle.constant = 1000
        
        /*
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         //        let mapViewControllerObj = storyboard.instantiateViewController(withIdentifier: "WebDealDetailVC") as? WebDealDetailVC
         //        self.navigationController?.pushViewController(mapViewControllerObj!, animated: true)
        */
        let storyboard = UIStoryboard(name: "UnlockedDeal", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SeeCodeVC") as! SeeCodeVC
        arrSeeCodeData.append(SeeCode_ModleData(SeeCode: "476wyfgi5", ExpireDays:"17days" ,City: "From Your City, Nottingham", isSeeCodeUsedBefore: false))
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @IBAction func tapToBack(_ sender: UIControl) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - Tableview Delegates And Datasource
extension CityListVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //array count row
        return arrtblData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblCityListCell") as! tblCityListCellVC
        
        
        let dic = arrtblData[indexPath.row]
        
        //set Cell Value
        cell.lblTitle.text = dic["title"] as? String
        
        cell.img_bg.image = UIImage(named:(dic["image_bg"] as? String)!)
        
        let strislock = dic["isLock"] as? String
        if strislock == "false"
        {
            cell.img_logo.image = UIImage(named:(dic["image"] as? String)!)
            cell.valueLabel.textColor = UIColor(red: 255.0/255.0, green: 79.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        }
        else
        {
            cell.btntblCellLogo.isHidden=true
            cell.img_logo.image = UIImage(named:(dic["selected_image"] as? String)!)
            cell.valueLabel.textColor = UIColor(red: 162.0/255.0, green: 160.0/255.0, blue: 160.0/255.0, alpha: 1.0)
        }
        return cell
    }    
}

class ShadowView: UIView {
    override var bounds: CGRect {
        didSet {
            setupShadow()
        }
    }
    
    private func setupShadow() {
        
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 5
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = true ? UIScreen.main.scale : 1
        
        /*
 
         let radius: CGFloat = demoView.frame.width / 2.0 //change it to .height if you need spread for height
         let shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 2.1 * radius, height: demoView.frame.height))
         //Change 2.1 to amount of spread you need and for height replace the code for height
         
         demoView.layer.cornerRadius = 2
         demoView.layer.shadowColor = UIColor.black.cgColor
         demoView.layer.shadowOffset = CGSize(width: 0.5, height: 0.4)  //Here you control x and y
         demoView.layer.shadowOpacity = 0.5
         demoView.layer.shadowRadius = 5.0 //Here your control your blur
         demoView.layer.masksToBounds =  false
         demoView.layer.shadowPath = shadowPath.cgPath
 */
    }
}


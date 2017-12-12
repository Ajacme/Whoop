//
//  WebDealDetailVC.swift
//  Whoop!
//
//  Created by Dilip manek on 03/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit
//
//class Insurance_data_SuperWhoop :  NSObject {
//
//    var title : String = ""
//    var desc : String = ""
//    var imageName : String = ""
//    var UnlockedimageName : String = ""
//    var isAddedSuper : Bool = false
//    var isGetQuotes : Bool = false
//     var displayMessage : String = ""
//    override init() {
//
//    }
//
//    init(title: String, desc: String, imageName: String, isAddedSuper: Bool , UnlockedimageName :String,isGetQuotes: Bool,displayMessage : String)
//    {
//        self.title = title
//        self.desc = desc
//        self.imageName = imageName
//        self.isAddedSuper = isAddedSuper
//        self.UnlockedimageName = UnlockedimageName
//        self.isGetQuotes = isGetQuotes
//        self.displayMessage = displayMessage
//    }
//}
//class CellForTickets: UITableViewCell {
//    @IBOutlet weak var cntrolTapImage: UIControl!
//    @IBOutlet weak var cntrolAddDeal: UIControl!
//    @IBOutlet weak var lblMainTitle: UILabel!
//    @IBOutlet weak var lblTapUnlock: UILabel!
//    @IBOutlet weak var lblDesc: UILabel!
//    @IBOutlet weak var lblLocked: UILabel!
//    @IBOutlet weak var viewForBack: UIView!
//    @IBOutlet weak var imgTopBG: UIImageView!
//    @IBOutlet weak var imgMiddleblue: UIImageView!
//    @IBOutlet weak var lblUnlockText: UILabel!
//    @IBOutlet weak var lblUnlockBy: UILabel!
//    var pulseEffect : PulsingHaloLayer!
//}
class AddSuperWhoopDetailVC: UIViewController {
    
    @IBOutlet weak var tableViewMain: UITableView!
    @IBOutlet weak var viewForHeader: UIView!
    @IBOutlet weak var cons_tablHeight: NSLayoutConstraint!
    var objCodePopUp = SuperWhoopPopUp()
    @IBOutlet weak var lblHeaderTitle: MTLabel!
    @IBOutlet weak var lblHeaderSubDesc: MTLabel!
    @IBOutlet weak var cons_lblHeaderMiddle: NSLayoutConstraint!

    var arrScrollData = [[String : Any]]()
    var  arrInsuranceData = [Insurance_data]()
    var addedDeal = 0
    @objc var scrollTimer:Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewMain.estimatedRowHeight = 401
        viewForHeader.frame = CGRect(x: 0, y: 0, width: ScreenSize.WIDTH, height: 90)
        tableViewMain.tableHeaderView = viewForHeader
        arrScrollData  = [["image" : "1st-deal","title" : "Deal 1".localized,"Desc":"Add 3 deals to activate\nyour Super Whoop! Saving".localized],["image" : "2nd-deal","title" : "Deal 2".localized,"Desc":"Add 3 deals to activate\nyour Super Whoop! Saving".localized],["image" : "3rd-deal","title" : "Deal 3".localized,"Desc":"Add 3 deals to activate\nyour Super Whoop! Saving".localized]]
        tableViewMain.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.new, context: nil)
        
        for dic in arrScrollData
        {
            let tableData = Insurance_data()
            tableData.title = dic["title"] as! String
            tableData.imageName = dic["image"] as! String
            tableData.desc = dic["Desc"] as! String
            tableData.isAddedSuper = false
           // tableData.UnlockedimageName = dic["selected_image"] as! String
            arrInsuranceData.append(tableData)
        }
        self.navigationController?.isNavigationBarHidden = true
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
           self.rippleEffectMethod()
        }
    }
    
    //MARK: - Click Events....
    @IBAction func tapToMiddleImage(_ sender: UIControl) {
        
    }
    @IBAction func tapToBack(_ sender: UIControl) {
            navigationController?.popViewController(animated: true)
    }
    @IBAction func tapToAddDeal(_ sender: UIControl) {
        //AddSuperWhoopVC
        let dictData = arrInsuranceData[sender.tag]
        if !dictData.isAddedSuper
        {
            let objNextVC = self.storyboard?.instantiateViewController(withIdentifier: "AddSuperWhoopVC") as! AddSuperWhoopVC
            objNextVC.selectedIndex = sender.tag
            self.navigationController?.pushViewController(objNextVC, animated: true)
        }
    }
    @IBAction func tapToClosePopUp(_ sender: UIButton) {
        self.objCodePopUp.removeFromSuperview()
        self.objCodePopUp.Cons_ViewMiddle.constant = 1000
    }
    @IBAction func tapBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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
            self.setInLastFullTheme()
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
            cell.lblUnlockBy.isHidden = false

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

extension AddSuperWhoopDetailVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrInsuranceData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellForTickets") as! CellForTickets
        let dic = arrInsuranceData[indexPath.row]
        //        cell.cntrolTapImage.tag = indexPath.row
        cell.lblMainTitle.text = dic.title
        cell.lblDesc.text = dic.desc
        cell.cntrolAddDeal.tag = indexPath.row
        if dic.isAddedSuper
        {
            self.setCellcolorAndImage(cell: cell, dic: dic)
        }else{
            cell.imgMiddleblue.image = UIImage(named: dic.imageName)
            cell.lblTapUnlock.text = ""
            cell.lblLocked.text = "Add a deal".localized
            cell.imgTopBG.image = nil
            cell.imgTopBG.backgroundColor = UIColor(red: 141.0 / 255.0, green: 142.0 / 255.0, blue: 143.0 / 255.0, alpha: 1.0)
            cell.lblUnlockText.isHidden = true
            cell.lblUnlockBy.isHidden = true
        }
        return cell
    }
    
    func setCellcolorAndImage(cell : CellForTickets ,dic : Insurance_data) {
        cell.imgMiddleblue.image = UIImage(named: dic.imageName)
        cell.lblLocked.text = "GET A QUOTE".localized
        cell.lblTapUnlock.text = dic.displayMessage
        cell.imgTopBG.backgroundColor = UIColor.clear
        cell.imgTopBG.image = UIImage(named:"bg")
    }
   
}

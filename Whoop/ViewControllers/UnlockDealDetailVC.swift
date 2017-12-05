//
//  WebDealDetailVC.swift
//  Whoop!
//
//  Created by Dilip manek on 03/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

/*class Insurance_data :  NSObject {

    var title : String = ""
    var desc : String = ""
    var imageName : String = ""
    var UnlockedimageName : String = ""
    var isLocked : Bool = false
    var displayMessage : String = ""
    var selectedBGImage : String = ""
    var isGetQuotes : Bool = false
    override init() {

    }

    init(title: String, desc: String, imageName: String, isLocked: Bool , UnlockedimageName :String, isGetQuotes: Bool,selectedBGImage : String,displayMessage : String)
    {
        self.title = title
        self.desc = desc
        self.imageName = imageName
        self.isLocked = isLocked
        self.UnlockedimageName = UnlockedimageName
        self.displayMessage = displayMessage
        self.isGetQuotes = isGetQuotes
        self.selectedBGImage = selectedBGImage

    }
}*/
/*class CellForTickets: UITableViewCell {
    @IBOutlet weak var cntrolTapImage: UIControl!
    @IBOutlet weak var lblMainTitle: UILabel!
    @IBOutlet weak var lblTapUnlock: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblLocked: UILabel!
    @IBOutlet weak var imgUnlock: UIImageView!
    @IBOutlet weak var viewForBack: UIView!
    @IBOutlet weak var imgTopBG: UIImageView!
    @IBOutlet weak var imgMiddleblue: UIImageView!
    @IBOutlet weak var cons_LockedLeading: NSLayoutConstraint!
}*/

class Header_Data : NSObject {
    var title : String = ""
    var desc : String = ""
    var imageName : String = ""
    var backgroundImageName : String = ""
    var category : String = ""
    
    override init() {
        
    }
    
    init(title: String, desc: String, imageName: String, backgroundImage: String, category: String) {
        
        self.title = title
        self.desc = desc
        self.imageName = imageName
        self.backgroundImageName = backgroundImage
        self.category = category
    }
}
class UnlockHeaderView: UIView {
    
    @IBOutlet weak var headerBackgroundImage: UIImageView!
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var headerDescriptionLabel: UILabel!
    @IBOutlet weak var headerLogoImage: UIImageView!
    
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        //        setup()
    }
    required init(coder aDecoder:NSCoder) {
        super.init(coder:aDecoder)!
        //        setup()
    }
}

class UnlockDealDetailVC: UIViewController {
    @IBOutlet var unlockHeaderView: UnlockHeaderView!
    @IBOutlet weak var tableViewMain: UITableView!
    var arrScrollData = [[String : Any]]()
    var  arrInsuranceData = [Insurance_data]()
    var headerViewData = [String : Any]()
    var headerData = Header_Data()
    var pulseEffect:PulsingHaloLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewMain.estimatedRowHeight = 401
//        viewForHeader.frame = CGRect(x: 0, y: 0, width: ScreenSize.WIDTH, height: 305)
        tableViewMain.tableHeaderView = unlockHeaderView

        if arrScrollData.count <= 0{
                    arrScrollData  = [
                        ["image" : "blue_plane","selected_image" :"gray_plane","title" : "Travel Insurance".localized,"desc":"This is your home's travel insurance deal".localized, "bgImage" : "bg"],
                        ["image" : "blue_travel_medical","selected_image" :"gray_travel_medical","title" : "Travel Insurance\n( Medical conditions )".localized,"desc":"This is your home's travel insurance (Medical conditions) deal".localized, "bgImage" : "bg"],
                        ["image" : "blue_car_break","selected_image" :"gray_car_break","title" : "Car breakdown".localized,"desc":"This is your home's Car breakdown deal".localized, "bgImage" : "bg"]]
        }
        
        for dic in arrScrollData
        {
            let tableData = Insurance_data()
            tableData.title = dic["title"] as! String
            tableData.imageName = dic["image"] as! String
            tableData.desc = dic["desc"] as! String
            tableData.isLocked = false
            tableData.UnlockedimageName = dic["selected_image"] as! String
            tableData.bgImage = dic["bgImage"] as! String
            arrInsuranceData.append(tableData)
        }
        print(headerViewData.count)
        if headerViewData.count > 0 {
            headerData.title = headerViewData["title"] as! String
            headerData.desc = headerViewData["desc"] as! String
            headerData.imageName = headerViewData["image"] as! String
            headerData.backgroundImageName = headerViewData["bgImage"] as! String
            self.setUpHeader()
        }
        self.navigationController?.isNavigationBarHidden = true
    }
    func setUpHeader(){
        let dic = headerData
        
        unlockHeaderView.headerTitleLabel.text = dic.title
        unlockHeaderView.headerDescriptionLabel.text = dic.desc
        unlockHeaderView.headerLogoImage.image = UIImage(named: dic.imageName)
        unlockHeaderView.headerBackgroundImage.image = UIImage(named: dic.backgroundImageName)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Click Events....
    @IBAction func tapToMiddleImage(_ sender: UIControl) {
        
    }
    @IBAction func tapToBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func tapToInfo(_ sender: UIButton) {
        
    }
    
    
}
//MARK: - Tableview Delegates And Datasource

extension UnlockDealDetailVC: UITableViewDelegate,UITableViewDataSource{
    
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
        
        if dic.isLocked
        {
            self.setCellcolorAndImage(cell: cell, dic: dic)
        }else{
            cell.imgMiddleblue.image = UIImage(named: dic.imageName)
            cell.imgTopBG.backgroundColor = UIColor.clear
            cell.cons_LockedLeading.constant = 0
            cell.imgUnlock.isHidden = true
            cell.lblTapUnlock.isHidden = false
            cell.lblLocked.text = "Locked".localized
            cell.imgTopBG.image = UIImage(named:dic.bgImage)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dic = arrInsuranceData[indexPath.row]

     if !dic.isLocked{
        
        let cell = tableView.cellForRow(at: indexPath) as! CellForTickets
       
      //  DispatchQueue.main.async(execute: {
            if self.pulseEffect != nil {
                self.pulseEffect.removeFromSuperlayer()
            }
            self.pulseEffect = PulsingHaloLayer()
            self.pulseEffect.haloLayerNumber = 7
            self.pulseEffect.animationDuration = 3
           // self.pulseEffect.beginTime = 0.0
            self.pulseEffect.radius = 125.0
            self.pulseEffect.backgroundColor = UIColor.init(red: 75/255.0, green: 166/255.0, blue: 249/255.0, alpha: 1.0).cgColor
            self.pulseEffect.position = cell.cntrolTapImage.center
            cell.viewForBack.layer.addSublayer(self.pulseEffect)
            self.pulseEffect.start()
       // })
        
        //cell.imgTopBG.bringSubview(toFront: cell.cntrolTapImage)
        cell.imgTopBG.backgroundColor = UIColor(red: 141.0 / 255.0, green: 142.0 / 255.0, blue: 143.0 / 255.0, alpha: 1.0)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            UIView.animate(withDuration: 1.5, animations: {
                 dic.isLocked = true
                self.setCellcolorAndImage(cell: cell, dic: dic)
                self.pulseEffect.backgroundColor = UIColor.init(red: 75/255.0, green: 166/255.0, blue: 249/255.0, alpha: 0.0).cgColor
               
            }, completion: { (result) in
                self.pulseEffect.removeFromSuperlayer()
            })
        }
        }
    }
    
    func setCellcolorAndImage(cell : CellForTickets ,dic : Insurance_data) {
        
        cell.imgMiddleblue.image = UIImage(named: dic.UnlockedimageName)
        cell.cons_LockedLeading.constant = 30
        cell.imgUnlock.isHidden = false
        cell.lblLocked.text = "Unlocked".localized
        cell.imgTopBG.image = nil
        cell.lblTapUnlock.isHidden = true
        cell.imgTopBG.backgroundColor = UIColor(red: 141.0 / 255.0, green: 142.0 / 255.0, blue: 143.0 / 255.0, alpha: 1.0)
    }
    
    
}

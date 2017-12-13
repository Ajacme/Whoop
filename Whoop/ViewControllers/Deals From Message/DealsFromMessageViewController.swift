//
//  DealsFromMessageViewController.swift
//  Whoop
//
//  Created by admin on 13/12/17.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit

class DealsFromMessageViewController: UIViewController {

    @IBOutlet var dealHeaderView: UnlockHeaderView!
    @IBOutlet weak var tableViewMain: UITableView!
    
    
    var arrScrollData = [[String : Any]]()
    var  arrInsuranceData = [Insurance_data]()
    var headerViewData = [String : Any]()
    var headerData = Header_Data()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewMain.estimatedRowHeight = 401
        tableViewMain.tableHeaderView = dealHeaderView
        
        arrScrollData = [
            ["image" : "blue_plane","selected_image" :"gray_plane","title" : "Unlock your home's insurance deals".localized,"desc":"To unlock your home's exclusive insurance deals go to Deals To Unlock or just tap the relevant unlock message".localized,"bgImage" : "bg_ins","message" : "Expires in 45 days".localized, "category":"Insurance"],
            
            
            ["image" : "blue_travel_medical","selected_image" :"gray_travel_medical","title" : "Use your deal".localized,"desc":"Everyone you live with can use the deal. just go to Unlocked Deals and find the deal you want to use.".localized,"bgImage" : "bg_ins","message" : "Expires in 45 days".localized, "category":"Insurance"],
            
            
            ["image" : "blue_car_break","selected_image" :"gray_car_break","title" : "See the insurers".localized,"desc":"From travel to car insurance just tap Get Quotes on the unlocked deal and you'll see the insurance brands who are ready to Whoop! You Happy with low prices.".localized,"bgImage" : "bg_ins","message" : "Expires in 45 days".localized, "category":"Insurance"],
            
            ["image" : "blue_travel_medical","selected_image" :"gray_travel_medical","title" : "Be Whoop!'d Happy".localized,"desc":"Find your preferred brand and tap their Whoop! Button to lower the prices on their website. Get ready for huge savings. Purchase your policy in the normal way".localized,"bgImage" : "bg_ins","message" : "Expires in 45 days".localized, "category":"Insurance"]
            ]

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
//        if headerViewData.count > 0 {
//            headerData.title = headerViewData["title"] as! String
//            headerData.desc = headerViewData["desc"] as! String
//            headerData.imageName = headerViewData["image"] as! String
//            headerData.backgroundImageName = headerViewData["bgImage"] as! String
//            headerData.category = headerViewData["category"] as! String
//            self.setUpHeader()
//        }
        
        
        // Do any additional setup after loading the view.
    }
    func setUpHeader(){
//        let dic = headerData
        
//        unlockHeaderView.headerTitleLabel.text = dic.title
//        unlockHeaderView.headerDescriptionLabel.text = dic.desc
//        unlockHeaderView.headerLogoImage.image = UIImage(named: dic.imageName)
//        unlockHeaderView.headerBackgroundImage.image = UIImage(named: dic.backgroundImageName)
    }
    
    @IBAction func tapToBack(_ sender: UIControl) {
        print("pop here")
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
//MARK: - Tableview Delegates And Datasource

extension DealsFromMessageViewController: UITableViewDelegate,UITableViewDataSource{
    
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
       
        
        //lblDealStep // imgTopBG  lblDesc  imgMiddleblue lblMainTitle  E0713A
//        var textToBold = ""
//        if indexPath.row == 0{
//            textToBold = "Deal to Unlock"
//        }
//        else if indexPath.row == 1{
//            textToBold = "Unlocked Deals"
//        }
//        else if indexPath.row == 2{
//            textToBold = "Get Quotes"
//        }
//        else{
//            textToBold = "Deal to Unlock"
//        }
//        let attributedStringDesc    = NSMutableAttributedString(string: dic.desc)
//        let rangeDesc              = ( dic.desc as NSString).range(of: textToBold)
//        let attrs: [NSAttributedStringKey: Any] = [.font: UIFont(name: "Lato-Semibold", size: 13) as! UIFont]
//        let boldString = NSMutableAttributedString(string:textToBold, attributes: attrs)
//        attributedStringDesc.addAttributes([NSAttributedStringKey.font],value: [.font: UIFont(name: "Lato-Semibold", size: 13) as! UIFont], range: rangeDesc)
//        attributedStringDesc.addAttribute(NSAttributedStringKey.font, value: UIFont(name: "Lato-Semibold", size: 13), range: rangeDesc)
//        attributedStringDesc.addAttributes([.font: UIFont(name: "Lato-Semibold", size: 13) as! UIFont], range: rangeDesc)
//        cell.lblDesc.attributedText = attributedStringDesc
        
        let textToChange = "Step \(indexPath.row+1)"
        let attributedString    = NSMutableAttributedString(string: textToChange)
        let range               = (textToChange as NSString).range(of: textToChange)
        
        attributedString.addAttribute(NSAttributedStringKey.underlineStyle, value: NSNumber(value: 1), range: range)
        attributedString.addAttribute(NSAttributedStringKey.underlineColor, value: UIColor.colorWithHexString(hex: "E0713A"), range: range)
        
        cell.lblDealStep.attributedText = attributedString
        cell.lblDealStep.textColor = UIColor.colorWithHexString(hex: "E0713A")
        
        
//        if dic.isLocked
//        {
//            self.setCellcolorAndImage(cell: cell, dic: dic)
//        }else{
//            cell.imgMiddleblue.image = UIImage(named: dic.imageName)
//            cell.imgTopBG.backgroundColor = UIColor.clear
//            cell.cons_LockedLeading.constant = 0
//            cell.imgUnlock.isHidden = true
//            cell.lblTapUnlock.isHidden = false
//            cell.imgTopBG.image = UIImage(named:dic.bgImage)
//
//        }
        return cell
    }
}



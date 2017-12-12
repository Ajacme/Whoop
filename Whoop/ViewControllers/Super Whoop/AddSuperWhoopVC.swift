//
//  WebDealDetailVC.swift
//  Whoop!
//
//  Created by Dilip manek on 03/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

//class SuperWhoopDeal :  NSObject {
//
//    var title : String = ""
//    var desc : String = ""
//    var imageName : String = ""
////    var selectedBGImage : String = ""
//    var isGetQuotes : Bool = false
//    var displayMessage : String = ""
//
//    override init() {
//
//    }
//
//    init(title: String, desc: String, imageName: String, isGetQuotes: Bool,displayMessage : String)
//    {
//        self.title = title
//        self.desc = desc
//        self.imageName = imageName
//        self.isGetQuotes = isGetQuotes
////        self.selectedBGImage = selectedBGImage
//        self.displayMessage = displayMessage
//    }
//}
class CellForSuperWhoop: UITableViewCell {
    
    @IBOutlet weak var cntrolAddSuper: UIControl!
//    @IBOutlet weak var btnTopIcon: UIButton!
    @IBOutlet weak var lblMainTitle: UILabel!
    @IBOutlet weak var lblUsesCredit: UILabel!
    @IBOutlet weak var lblUnlockBy: UILabel!
//    @IBOutlet weak var lblDealBoosted: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
//    @IBOutlet weak var lblGetQuotes: UILabel!
//    @IBOutlet weak var viewForBack: UIView!
    // @IBOutlet weak var viewForShadow: UIView!
//    @IBOutlet weak var imgTopBG: UIImageView!
    @IBOutlet weak var imgMiddleblue: UIImageView!
}
class AddSuperWhoopVC: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var tableViewMain: UITableView!
    @IBOutlet weak var viewForHeader: UIView!
    var arrScrollData = [[String : Any]]()
    var  arrSuperWhoopData = [Insurance_data]()
    var pulseEffect:PulsingHaloLayer!
    var selectedIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewMain.estimatedRowHeight = 401
        viewForHeader.frame = CGRect(x: 0, y: 0, width: ScreenSize.WIDTH, height: 95)
        tableViewMain.tableHeaderView = viewForHeader
        arrScrollData  = [
            ["image" : "blue-travel-insurance","title" : "Travel Insurance".localized,"Desc":"You'll only use this credit/deal if you buy a policy".localized , "message" : "Uses 1 credit".localized],
            ["image" : "blue-travel-medical","title" : "Travel Insurance with Medical".localized,"Desc":"You'll only use this credit/deal if you buy a policy".localized , "message" : "Uses 1 credit".localized],
            ["image" : "blue_car_break","title" : "Car breakdown".localized,"Desc":"You'll only use this credit/deal if you buy a policy".localized , "message" : "Uses 1 credit".localized]]
        
        for dic in arrScrollData
        {
            let tableData = Insurance_data()
            tableData.title = dic["title"] as! String
            tableData.imageName = dic["image"] as! String
            tableData.displayMessage = dic["message"] as! String
            tableData.desc = dic["Desc"] as! String
//            tableData.selectedBGImage = dic["selected_bg"] as! String
            arrSuperWhoopData.append(tableData)
        }
        self.tabBarController?.tabBar.isHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Click Events....
//    @IBAction func tapToMiddleImage(_ sender: UIControl) {
//
//    }
    @IBAction func tapToBack(_ sender: UIControl) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func tapToAddDeal(_ sender: UIControl) {
        let dict = arrSuperWhoopData[sender.tag]
        dict.displayMessage = "Tap to  unlock".localized
        dict.isAddedSuper = true
        //dict.desc = "You'll only use this credit/deal if you buy a policy"
        if self.navigationController != nil{
            for vc in (self.navigationController?.viewControllers)!{
                if vc is AddSuperWhoopDetailVC{
                    let vcontroll  :AddSuperWhoopDetailVC = vc as! AddSuperWhoopDetailVC
                    vcontroll.getSelectedCode(selectedDealData: dict, selectedIndex: selectedIndex)
                    break
                }
            }
        }
        self.navigationController?.popViewController(animated: true)
    }
}
//MARK: - Tableview Delegates And Datasource

extension AddSuperWhoopVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSuperWhoopData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellForSuperWhoop") as! CellForSuperWhoop
        let dic = arrSuperWhoopData[indexPath.row]
        cell.lblMainTitle.text = dic.title
        cell.lblDesc.text = dic.desc
        cell.cntrolAddSuper.tag = indexPath.row
        cell.imgMiddleblue.image = UIImage(named:dic.imageName)
        return cell
    }
}


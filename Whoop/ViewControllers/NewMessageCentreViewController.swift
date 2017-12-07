//
//  NewMessageCentreViewController.swift
//  Whoop
//
//  Created by ZaeemZafar on 12/11/2017.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit
import AASegmentedControl

typealias ImageTextTuple = (image: UIImage, text: String)

class NewMessageCentreViewController: UIViewController {

    @IBOutlet weak var segmentControl: AASegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    var tempIndexStore: Int = 0
    var tempIndexStore2: Int = 0
    
    @IBAction func backButtonClicked(_ sender: UIButton) {
        
        self.navigationController?.isNavigationBarHidden = false
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        
        self.navigationController?.isNavigationBarHidden = true
        
        super.viewDidLoad()

        self.setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        segmentControl.itemNames = ["All", "Unlocks", "WMH"]
            segmentControl.font = UIFont.systemFont(ofSize: 18)
            segmentControl.selectedIndex = 0
            
            // Add listener and observe changes!
            segmentControl.addTarget(self, action: #selector(self.segmentValueChanged(_:)), for: .valueChanged)
        
        self.tableView.estimatedRowHeight = 190
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    
    @objc func segmentValueChanged(_ sender: AASegmentedControl) {
        
        let optionSelected = MessageCenterTapOption(rawValue: sender.selectedIndex)!
        
        print("selected index is \(sender.isSelected)")
        
        switch optionSelected {
            
        case .all:
            print("All button tapped")
        case .unlocks:
            print("unlock button tapped")
        case .wmh:
            print("wmh button tapped")
        }
        
    }
   

}


extension NewMessageCentreViewController: UITableViewDataSource, UITableViewDelegate {
    
    /*func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            return tableView.dequeueReusableCell(withIdentifier: "CellWithImages")!
        } else {
            return tableView.dequeueReusableCell(withIdentifier: "CellWithNote")!
        }
        
    }
    */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 13
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        /*if let headerView = tableView.dequeueReusableCell(withIdentifier: "NotificationsHeaderCell") as? NotificationsHeaderCell {
         let image = (section == 0) ? #imageLiteral(resourceName: "pin_icon") : #imageLiteral(resourceName: "recent_icon")
         let text = (section == 0) ? "Pinned" : "Recent"
         headerView.set(image: image, text: text)
         return headerView
         }*/
        return UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width - 40, height: 10))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0,2:
            return getHeaderCell(section: indexPath.section)
        case 1:
            return getCardMainCell(indexPath: indexPath)
        case 3:
            return tableView.dequeueReusableCell(withIdentifier: "CellWithImages")!
        case 4:
            return tableView.dequeueReusableCell(withIdentifier: "CellWithNote")!
        case 5:
            return tableView.dequeueReusableCell(withIdentifier: "CityCellWithNote")!
        case 6:
            return tableView.dequeueReusableCell(withIdentifier: "PlumberReviewCell")!
            
        case 8:
            return getCardsBannerCell(indexPath: indexPath)
        default:
            return getDealsCell(section: indexPath.section)
        }
    
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        
    }
    
    func getHeaderCell(section: Int) -> UITableViewCell {
        if let headerView = tableView.dequeueReusableCell(withIdentifier: "NotificationsHeaderCell") as? NotificationsHeaderCell {
            let image = (section == 0) ? #imageLiteral(resourceName: "pinned") : #imageLiteral(resourceName: "recent")
            let text = (section == 0) ? "Pinned" : "Recent"
            headerView.set(image: image, text: text)
            return headerView
        }
        return UITableViewCell()
    }
    
    func getCardMainCell(indexPath: IndexPath) -> UITableViewCell {
        let text = "It's great you have a Whoop! Button Find our more about it here"
        let cardsDetails: [CardsDetails] = [
            CardsDetails(title: "Great to see you here!", description: text, userImage: #imageLiteral(resourceName: "whoop!_me_happy_face")),
            CardsDetails(title: "Great to see you here!2", description: text, userImage: #imageLiteral(resourceName: "whoop!_me_happy_face")),
            CardsDetails(title: "Great to see you here!3", description: text, userImage: #imageLiteral(resourceName: "whoop!_me_happy_face")),
            CardsDetails(title: "Great to see you here!4", description: text, userImage: #imageLiteral(resourceName: "whoop!_me_happy_face"))
        ]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CardsCell") as? CardsCell {
            cell.set(data: cardsDetails, selectedIndex: tempIndexStore2) { direction, index in
                self.tempIndexStore2 = index
                self.tableView.reloadRows(at: [indexPath], with: direction)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func getCardsBannerCell(indexPath: IndexPath) -> UITableViewCell  {
        let cardsDetails: [CardsDetails] = [
            CardsDetails(title: "Big brands and local businesses can't wait to Whoop! You happy with lower prices.", description: "Swipe to see some of your home's deals", userImage: #imageLiteral(resourceName: "brand_broadband"), bannerImage: #imageLiteral(resourceName: "unlockFirstdeal")),
            CardsDetails(title: "Car Breakdown insurance", description: "There are 96000 cars deals left in London 4600 have been unlocked there.", userImage: #imageLiteral(resourceName: "blue_car_break"), bannerImage: #imageLiteral(resourceName: "save_money_on_car_breakdown")),
            
            CardsDetails(title:"Conveyancing Deal" , description: "Moving home is expensive.Unlock your home's conveyancing deal now to save money on expert local conveyancing", userImage: #imageLiteral(resourceName: "conveyancer_deal"), bannerImage:#imageLiteral(resourceName: "save_money_on_conveyncing_deal") ),
            
            CardsDetails(title:"Yummy! Cheaper Takeaway Pizza" , description: "Popular takeaways can't wait to Whoop! You happy", userImage: #imageLiteral(resourceName: "using_deal"), bannerImage: #imageLiteral(resourceName: "save_money_on_pizza")),
            
            
            CardsDetails(title: "Travel Insurande" , description:"Pre exciting medical conditions your home's Whoop! Button include an exclusive travel insurance deal for tavellers with pre existing medical conditions", userImage: #imageLiteral(resourceName: "medical_insurence"), bannerImage: #imageLiteral(resourceName: "save_on_medical_holiday_insurence"))
        ]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CardsCell") as? CardsCell {
            
//            if tempIndexStore == 0{
//                cell.hyperLinkLabel.textColor = UIColor.black
//                let textToChange = "The deal is unlocked, Unlocked by: Sandip Gopani"
//                let attributedString    = NSMutableAttributedString(string: textToChange)
//                let range               = (textToChange as NSString).range(of: "The deal is unlocked, Unlocked by:")
//                attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.colorWithHexString(hex: "FE8B3A"), range: range)
//
//                cell.hyperLinkLabel.attributedText = attributedString
//            }
            cell.set(data: cardsDetails, selectedIndex: tempIndexStore) { direction, index in
                self.tempIndexStore = index
                self.tableView.reloadRows(at: [indexPath], with: direction)
            }
            cell.unlockHomesDeal.tag = indexPath.section
            cell.unlockHomesDeal.addTarget(self, action: #selector(self.tapToCardDeals(_:)), for: .touchUpInside)
            return cell
        }
        return UITableViewCell()
    }
    
    func getDealsCell(section: Int) -> UITableViewCell  {
        let indexHandler: [Int: Int] = [7: 0, 9: 1, 10: 2, 11: 3, 12: 4]
        let imageTextData: [ImageTextTuple] = [
            (#imageLiteral(resourceName: "imsurence_deals"),"Insurance Deals"),
            (#imageLiteral(resourceName: "vehicle_deals"),"Vehicle Deals"),
            (#imageLiteral(resourceName: "tradesperson_deals"),"Tradesperson Deals"),
            (#imageLiteral(resourceName: "moving_home_deals"),"Moving Home Deals"),
            (#imageLiteral(resourceName: "whoop!_me_happy_face"),"Technology Deals ( Mobile / Broadband )")
        ]
        
        let currentData = imageTextData[indexHandler[section]!]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DealsCell") as? DealsCell {
            cell.set(image: currentData.image, text: currentData.text)
            cell.actionButtonDeals.tag = section
            cell.actionButtonDeals.addTarget(self, action: #selector(self.tapToDeals(_:)), for: .touchUpInside)
            return cell
        }
        return UITableViewCell()
    }
     @IBAction func tapToCardDeals(_ sender: UIButton) {
        if let initVC = self.storyboard?.instantiateViewController(withIdentifier: "SettingUnlockDealViewController") as? SettingUnlockDealViewController{
            initVC.isDealToUnlock = true
            self.navigationController?.pushViewController(initVC, animated: true)
        }
    }
    @IBAction func tapToDeals(_ sender: UIButton) {
        let indexHandler: [Int: Int] = [7: 0, 9: 1, 10: 2, 11: 3, 12: 4]
        var vcTitle = ""
        if let iPath = indexHandler[sender.tag]{
//            let indexPathDeal = IndexPath(row:iPath , section: sender.tag)
//
//            let cell = tableView.cellForRow(at: indexPathDeal) as? DealsCell
//            print(cell?.dealNameLabel.text)
//
//            if let titile = cell?.dealNameLabel.text{
                switch iPath{
                case 0:
                    vcTitle = "Insurance"
                    break
                case 1:
                    vcTitle = "My Vehicle"
                    break
                case 2:
                    vcTitle = "Tradespeople"
                    break
                case 3:
                    vcTitle = "Moving Home"
                    break
                case 4:
                    vcTitle = "Technology"
                    break
                    
                default:
                    break
                
            }
            
            if let initVC = self.storyboard?.instantiateViewController(withIdentifier: "UnlockDealDetailVC") as? UnlockDealDetailVC{
                initVC.headerViewData = DealsToUnlockData().getDataForHeader(dealName: vcTitle, isDealToUnlock: true)
                initVC.arrScrollData = DealsToUnlockData().getDataForView(dealName: vcTitle, isDealToUnlock: true)
                self.navigationController?.pushViewController(initVC, animated: true)
            }
           
        }
        
       

        
    }
    @IBAction func tapSeeBrandsButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        var arrScrollData = [[String : Any]]()
        var  arrInsuranceData = [Insurance_data]()
        
        
        if arrScrollData.count <= 0{
            arrScrollData = [
                ["image" : "blue_plane","selected_image" :"gray_plane","title" : "Travel Insurance".localized,"desc":"This is your home's travel insurance deal".localized,"bgImage" : "bg_ins","message" : "Expires in 45 days".localized, "category":"Insurance"],
                
                
                ["image" : "blue_travel_medical","selected_image" :"gray_travel_medical","title" : "Travel Insurance\n( Medical conditions )".localized,"desc":"This is your home's travel insurance (Medical conditions) deal".localized,"bgImage" : "bg_ins","message" : "Expires in 45 days".localized, "category":"Insurance"],
                
                
                ["image" : "blue_car_break","selected_image" :"gray_car_break","title" : "Car breakdown".localized,"desc":"This is your home's Car breakdown deal".localized,"bgImage" : "bg_ins","message" : "Expires in 45 days".localized, "category":"Insurance"]]
            
        }
        
        for dic in arrScrollData
        {
            let tableData = Insurance_data()
            tableData.title = dic["title"] as! String
            tableData.imageName = dic["image"] as! String
            tableData.displayMessage = dic["message"] as! String
            tableData.desc = dic["desc"] as! String
            tableData.isGetQuotes = false
            tableData.selectedBGImage = dic["selected_image"] as! String
            tableData.bgImage = dic["bgImage"] as! String
            arrInsuranceData.append(tableData)
        }
        
        if let objSeeCodeVC = storyboard.instantiateViewController(withIdentifier: "WMHVC") as? WMHVC{
            objSeeCodeVC.arrScrollData = BrandList().getDataForView(dealName: "Insurance", atIndex: 0)
            objSeeCodeVC.headerViewData = BrandList().getDataForHeader(dealName: "Insurance", data: arrInsuranceData[0])
            self.navigationController?.pushViewController(objSeeCodeVC, animated: true)
        }
    }
    
    
    
    
    
}

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
        return 11
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
            
        case 7:
            return getCardsBannerCell(indexPath: indexPath)
        default:
            return getDealsCell(section: indexPath.section)
        }
    
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let indexHandler: [Int: Int] = [6: 0, 8: 1, 9: 2, 10: 3]
        
        
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
            CardsDetails(title: "Big brands and local business can't wait to Whoop! You happy with lower prices.", description: "Swipe to see some of your home's deals", userImage: #imageLiteral(resourceName: "whoop!_me_happy_face"), bannerImage: #imageLiteral(resourceName: "unlockFirstdeal")),
            CardsDetails(title: "Car Breakdown insurance", description: "There are 96000 cars deals left in London 4600 have been unlocked there.", userImage: #imageLiteral(resourceName: "medical_insurence"), bannerImage: #imageLiteral(resourceName: "save_money_on_car_breakdown")),
            
            CardsDetails(title:"Conveyancing Deal" , description: "Moving home is expensive.Unlock your home's conveyancing deal now to save money on expert local conveyancing", userImage: #imageLiteral(resourceName: "medical_insurence"), bannerImage:#imageLiteral(resourceName: "save_money_on_conveyncing_deal") ),
            
            CardsDetails(title:"Yummy! Cheaper Takeaway Pizza" , description: "Popular takeaways can't wait to Whoop! You happy", userImage: #imageLiteral(resourceName: "medical_insurence"), bannerImage: #imageLiteral(resourceName: "save_money_on_pizza")),
            
            
            CardsDetails(title: "Travel Insurande" , description:"Pre exciting medical conditions your home's Whoop! Button include an exclusive travel insurance deal for tavellers with pre existing medical conditions", userImage: #imageLiteral(resourceName: "medical_insurence"), bannerImage: #imageLiteral(resourceName: "save_on_medical_holiday_insurence"))
        ]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CardsCell") as? CardsCell {
            cell.set(data: cardsDetails, selectedIndex: tempIndexStore) { direction, index in
                self.tempIndexStore = index
                self.tableView.reloadRows(at: [indexPath], with: direction)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func getDealsCell(section: Int) -> UITableViewCell  {
        let indexHandler: [Int: Int] = [6: 0, 8: 1, 9: 2, 10: 3]
        let imageTextData: [ImageTextTuple] = [
            (#imageLiteral(resourceName: "imsurence_deals"),"Insurance Deals"),
            (#imageLiteral(resourceName: "vehicle_deals"),"Vehicle Deals"),
            (#imageLiteral(resourceName: "tradesperson_deals"),"Tradesperson Deals"),
            (#imageLiteral(resourceName: "moving_home_deals"),"Moving Home Deals")
        ]
        
        let currentData = imageTextData[indexHandler[section]!]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DealsCell") as? DealsCell {
            cell.set(image: currentData.image, text: currentData.text)
            return cell
        }
        return UITableViewCell()
    }
    
    
    
    
    
}

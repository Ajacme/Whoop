//
//  SettingUnlockDealViewController.swift
//  Whoop
//
//  Created by ACMEUNIVERSE MAC-2 on 29/11/17.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit

class SettingUnlockDealViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var descriptionText: UILabel!
    let headerAttributes : [NSAttributedStringKey: Any] = [
        NSAttributedStringKey.font : UIFont.systemFont(ofSize: 24),
        NSAttributedStringKey.foregroundColor : UIColor.black,
        NSAttributedStringKey.underlineStyle : NSUnderlineStyle.styleSingle.rawValue]
    var isDealToUnlock = false
    @IBOutlet var headerYourDeals: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrData = [[String : Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        setUpView()
    }
    func setUpView(){
        if isDealToUnlock{
             arrData  = [
                ["image" : "moving_home_deals", "title" : "Moving home","badge":"11"],
                ["image" : "insurance", "title" : "Insurance","badge":"6"],
                ["image" : "tradesperson_deals", "title" : "Tradespeople","badge":"9"],
                ["image" : "vehicle_deals", "title" : "My Vehicle","badge":"3"],
                ["image" : "whoop!_me_happy_face", "title" : "Technology","badge":"3"]
            ]
            headerYourDeals.attributedText = NSMutableAttributedString(string: "Your Whoop! Button is loaded these deals.",attributes: headerAttributes)
        }else{
             arrData  = [
                ["image" : "moving_home_deals", "title" : "Moving home","badge":"13"],
                ["image" : "insurance", "title" : "Insurance","badge":"4"],
                ["image" : "tradesperson_deals", "title" : "Tradespeople","badge":"3"],
                ["image" : "vehicle_deals", "title" : "My Vehicle","badge":"5"],
                ["image" : "whoop!_me_happy_face", "title" : "Technology","badge":"1"]
            ]
            descriptionText.text = "You or someone you live with has unlocked these deals. If you have a Whoop! Me Happier boost code you can boost your savings"
            headerYourDeals.attributedText = NSMutableAttributedString(string: "Unlocked deals",attributes: headerAttributes)
        }
    }

    @IBAction func tapOnInsuranceDeals(_ sender: Any) {

    }
    @IBAction func tapTrades(_ sender: Any) {
        
    }
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? settingUnlockCollectionViewCell
        
        let dic = arrData[indexPath.row]
        cell?.imageView.image = UIImage(named: (dic["image"] as? String)!)
        cell?.badgeLabel.text = dic["badge"] as? String
        cell?.titleLabel.text = dic["title"] as? String
        
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as? settingUnlockCollectionViewCell
        if let title = cell?.titleLabel.text{
            if isDealToUnlock{
                if let initVC = self.storyboard?.instantiateViewController(withIdentifier: "UnlockDealDetailVC") as? UnlockDealDetailVC{
                    initVC.headerViewData = DealsToUnlockData().getDataForHeader(dealName: title, isDealToUnlock: isDealToUnlock)
                    initVC.arrScrollData = DealsToUnlockData().getDataForView(dealName: title, isDealToUnlock: isDealToUnlock)
                    self.navigationController?.pushViewController(initVC, animated: true)
                }
                
            }else{
                let storyBoard = UIStoryboard(name: "UnlockedDeal", bundle: Bundle.main)
                let initVC = storyBoard.instantiateViewController(withIdentifier: "WebDealDetailVC") as! WebDealDetailVC
                initVC.headerViewData = DealsToUnlockData().getDataForHeader(dealName: title, isDealToUnlock: isDealToUnlock)
                initVC.arrScrollData = DealsToUnlockData().getDataForView(dealName: title, isDealToUnlock: isDealToUnlock)
                self.navigationController?.pushViewController(initVC, animated: true)
            }
            
        }
      
    }
    
}

class settingUnlockCollectionViewCell : UICollectionViewCell {
    
    @IBOutlet weak var badgeLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //        self.imageView.layer.cornerRadius = imageView.frame.height/2
        self.badgeLabel.layer.cornerRadius = badgeLabel.frame.height/2
        
    }
}

extension SettingUnlockDealViewController : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var collectionViewSize = collectionView.frame.size
        collectionViewSize.width = collectionViewSize.width/3.2 //Display Three elements in a row.
        collectionViewSize.height = collectionViewSize.height/2.3
        
        return collectionViewSize
    }
}
class DealsToUnlockData{
   
    // Header View Data
    public func getDataForHeader(dealName:String, isDealToUnlock:Bool) ->[String : Any]{
        var headerData = [String : Any]()
        
        switch dealName {
            
        case "Insurance":
            if isDealToUnlock{
                
                headerData = ["image" : "insurance","title" : "Insurance","desc" : "Here are your home's insurance deals. Tap the ones you want to unlock this month","bgImage" : "bg_ins"]
                
            }else{
                
                headerData = ["image" : "info_ins","title" : "Use a deal you've unlocked","desc" : "If you have Whoop! Me Happy\ncode you can boost your savings"]
            }
        case "Tradespeople":
            if isDealToUnlock{
                headerData = ["image" : "tradeperson","title" : "Tradesperson","desc" : " Here are your home's tradespeople deals. Tap the ones you want to unlock this month","bgImage" : "bg_tra"]
            }else{
                headerData = ["image" : "info_tra","title" : "Use a deal you've unlocked","desc" : "If you have Whoop! Me Happy\ncode you can boost your savings"]
            }
            
            
        case "Technology":
            if isDealToUnlock{
                headerData = ["image" : "whoop!_me_happy_face","title" : "Technology","desc" : " Here are your home's exclusive Technology deals. Tap the ones you want to unlock this month","bgImage" : "bg_tra"]
            }else{
                headerData = ["image" : "info_ins","title" : "Use a deal you've unlocked","desc" : "If you have Whoop! Me Happy\ncode you can boost your savings", "message":"Expires in 45 days"]
            }
        case "My Vehicle":
            if isDealToUnlock{
                headerData = ["image" : "whoop!_me_happy_face","title" : "My Vehicle","desc" : " Here are your home's vehicle deals. Unlock the ones you need","bgImage" : "bg"]
            }else{
                headerData = ["image" : "info_white","title" : "Use a deal you've unlocked","desc" : "If you have Whoop! Me Happy\ncode you can boost your savings", "message":"Expires in 45 days"]
            }
            
        default:
            return headerData
        }
        
        return headerData
    }
    public func getDataForView(dealName:String, isDealToUnlock:Bool) ->[[String : Any]]{
        var arrScrollData = [[String : Any]] ()
        switch dealName {
        case "Insurance":
            if isDealToUnlock{
                arrScrollData = [
                    ["image" : "blue_plane","selected_image" :"gray_plane","title" : "Travel Insurance".localized,"desc":"This is your home's travel insurance deal".localized,"bgImage" : "bg_ins","message" : "Expires in 45 days".localized],
                    
                    
                    ["image" : "blue_travel_medical","selected_image" :"gray_travel_medical","title" : "Travel Insurance\n( Medical conditions )".localized,"desc":"This is your home's travel insurance (Medical conditions) deal".localized,"bgImage" : "bg_ins","message" : "Expires in 45 days".localized],
                    
                    
                    ["image" : "blue_car_break","selected_image" :"gray_car_break","title" : "Car breakdown".localized,"desc":"This is your home's Car breakdown deal".localized,"bgImage" : "bg_ins","message" : "Expires in 45 days".localized]]
            }else{
                arrScrollData = [
                    ["image" : "blue_plane","selected_image" :"gray_plane","title" : "Travel Insurance".localized,"desc":"This is your home's travel insurance deal".localized,"bgImage" : "bg_ins","message" : "Expires in 45 days".localized],
                    
                    
                    ["image" : "blue_travel_medical","selected_image" :"gray_travel_medical","title" : "Travel Insurance\n( Medical conditions )".localized,"desc":"This is your home's travel insurance (Medical conditions) deal".localized,"bgImage" : "bg_ins","message" : "Expires in 45 days".localized],
                    
                    
                    ["image" : "blue_car_break","selected_image" :"gray_car_break","title" : "Car breakdown".localized,"desc":"This is your home's Car breakdown deal".localized,"bgImage" : "bg_ins","message" : "Expires in 45 days".localized]
                ]
            }
            
            
        case "Tradespeople":
            if isDealToUnlock{
                arrScrollData = [
                    ["image" : "plumber","selected_image" :"plumber_white","title" : "Plumber".localized,"desc":"This is your home's local plumber deal".localized,"bgImage" : "bg_tra", "message" : "Expires in 45 days"]
                ]
            }else{
                arrScrollData = [
                    ["image" : "plumber","selected_image" :"plumber_white","title" : "Plumber".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_tra", "message" : "Uses 1 credit"]
                ]
            }
            
            
        case "Technology":
            if isDealToUnlock{
                arrScrollData = [
                    ["image" : "whoop!_me_happy_face","selected_image" :"footer_whoop!_me_happy","title" : "Broadband Deal".localized,"desc":"Big name broadband brands are ready to Whoop@! You Happy with an exclusive price".localized,"bgImage" : "bg_tra", "message" : "Expires in 45 days"],
                    ["image" : "whoop!_me_happy_face","selected_image" :"footer_whoop!_me_happy","title" : "Mobile Phone".localized,"desc":"Your favourite mobile brands are ready to Whoop! You Happy".localized,"bgImage" : "bg_tra", "message" : "Expires in 45 days"]
                ]
            }else{
                arrScrollData = [
                     ["image" : "whoop!_me_happy_face","selected_image" :"footer_whoop!_me_happy","title" : "Broadband".localized,"desc":"This is your home's local plumber deal".localized,"bgImage" : "bg_tra", "message" : "Expires in 45 days"],
                    ["image" : "whoop!_me_happy_face","selected_image" :"footer_whoop!_me_happy","title" : "Mobile".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_tra", "message" : "Uses 1 credit"]
                   
                ]
            }
        case "My Vehicle":
            if isDealToUnlock{
                arrScrollData = [
                    ["image" : "whoop!_me_happy_face","selected_image" :"footer_whoop!_me_happy","title" : "Car MOT and Services Deal".localized,"desc":"Expert mechanics are ready to Whoop! You Happy".localized,"bgImage" : "bg_tra", "message" : "Expires in 45 days"],
                    ["image" : "whoop!_me_happy_face","selected_image" :"footer_whoop!_me_happy","title" : "Car Tyres Deal".localized,"desc":"Unlock to get brand tyres fitted locally".localized,"bgImage" : "bg_tra", "message" : "Expires in 45 days"]
                ]
            }else{
                arrScrollData = [
                    ["image" : "whoop!_me_happy_face","selected_image" :"footer_whoop!_me_happy","title" : "Car MOT and Services Deal".localized,"desc":"This is your home's local plumber deal".localized,"bgImage" : "bg_tra", "message" : "Expires in 45 days"],
                    ["image" : "whoop!_me_happy_face","selected_image" :"footer_whoop!_me_happy","title" : "Car Tyres Deal".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg", "message" : "Uses 1 credit"]
                    
                ]
            }

                
        default:
            return arrScrollData
        }
        return arrScrollData
    }
}

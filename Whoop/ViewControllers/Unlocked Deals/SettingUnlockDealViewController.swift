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
             arrData  = [["image" : "moving_home_deals", "title" : "Moving home","badge":"11"],["image" : "insurance", "title" : "Insurance","badge":"6"],["image" : "tradesperson_deals", "title" : "Tradespeople","badge":"9"],["image" : "vehicle_deals", "title" : "Vehicle","badge":"3"]]
            headerYourDeals.attributedText = NSMutableAttributedString(string: "Your Whoop! Button is loaded these deals.",attributes: headerAttributes)
        }else{
             arrData  = [["image" : "moving_home_deals", "title" : "Moving home","badge":"13"],["image" : "insurance", "title" : "Insurance","badge":"4"],["image" : "tradesperson_deals", "title" : "Tradespeople","badge":"3"],["image" : "vehicle_deals", "title" : "Vehicle","badge":"5"]]
            descriptionText.text = "You or someone you live with has unlocked these deals. If you have a Whoop! Me Happier boost code you can boost your savings"
            headerYourDeals.attributedText = NSMutableAttributedString(string: "Unlocked deals",attributes: headerAttributes)
        }
    }

    @IBAction func tapOnInsuranceDeals(_ sender: Any) {
        
        if isDealToUnlock{
            if let initVC = self.storyboard?.instantiateViewController(withIdentifier: "UnlockDealDetailVC") as? UnlockDealDetailVC{
                
                initVC.arrScrollData = getDataForView(dealName: "Insurance")
                
                self.navigationController?.pushViewController(initVC, animated: true)
            }
        }else{
            let storyBoard = UIStoryboard(name: "UnlockedDeal", bundle: Bundle.main)
            let initVC = storyBoard.instantiateViewController(withIdentifier: "WebDealDetailVC") as! WebDealDetailVC
            initVC.arrScrollData = getDataForView(dealName: "Insurance")
            self.navigationController?.pushViewController(initVC, animated: true)
        }
       
        
    }
    @IBAction func tapTrades(_ sender: Any) {
         if isDealToUnlock{
            if let initVC = self.storyboard?.instantiateViewController(withIdentifier: "UnlockDealDetailVC") as? UnlockDealDetailVC{
                
                initVC.arrScrollData = getDataForView(dealName: "TradesPeople")
                
                self.navigationController?.pushViewController(initVC, animated: true)
            }else{
                let storyBoard = UIStoryboard(name: "UnlockedDeal", bundle: Bundle.main)
                let initVC = storyBoard.instantiateViewController(withIdentifier: "WebDealDetailVC") as! WebDealDetailVC
                initVC.arrScrollData = getDataForView(dealName: "TradesPeople")
                self.navigationController?.pushViewController(initVC, animated: true)
            }
        }
        
    }
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // Header View Data
    public func getDataForHeader(dealName:String) ->[String : Any]{
        var headerData = [String : Any]()
        
        switch dealName {
          
        case "Insurance":
                if isDealToUnlock{
                    
                    headerData = ["image" : "insurance","title" : "Insurance","desc" : "Here are your home's insurance deals. Tap the ones you want to unlock this month","bgImage" : "bg_ins"]
                    
                }else{
                    
                    headerData = ["image" : "info_ins","title" : "Use a deal you've unlocked","desc" : "Insurance If you have Whoop! Me Happy\ncode you can boost your savings"]
                }
        case "TradesPeople":
            if isDealToUnlock{
                headerData = ["image" : "tradeperson","title" : "Tradesperson","desc" : " Here are your home's tradespeople deals. Tap the ones you want to unlock this month","bgImage" : "bg_tra"]
            }else{
                headerData = ["image" : "info_tra","title" : "Use a deal you've unlocked","desc" : "Tradesperson If you have Whoop! Me Happy\ncode you can boost your savings"]
            }
           
            
        case "Technology":
            if isDealToUnlock{
                headerData = ["image" : "info_tra","title" : "Tradesperson","desc" : "Your home's Whoop! Button has 1 exclusive Tradesperson deal added to it. Unlock and your local Whoop! expert tradespeople"]
            }else{
                headerData = ["image" : "info_ins","title" : "Tradesperson","desc" : "Everyone you live with canuse this deal", "message":"Expires in 45 days"]
            }
            
        default:
            return headerData
        }
        
        return headerData
    }
    public func getDataForView(dealName:String) ->[[String : Any]]{
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
               
            
        case "TradesPeople":
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
            arrScrollData = [
                ["image" : "blue_plane","selected_image" :"gray_plane","title" : "Travel Insurance".localized,"desc":"This is your home's travel insurance deal".localized,"bgImage" : "bg"],
                
                ["image" : "blue_travel_medical","selected_image" :"gray_travel_medical","title" : "Travel Insurance\n( Medical conditions )".localized,"desc":"This is your home's travel insurance (Medical conditions) deal".localized,"bgImage" : "bg"],
                
                ["image" : "blue_car_break","selected_image" :"gray_car_break","title" : "Car breakdown".localized,"desc":"This is your home's Car breakdown deal".localized,"bgImage" : "bg"]]
        default:
            return arrScrollData
        }
        return arrScrollData
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
        
        
        /*
         
         arrData  = [["image" : "moving_home_deals", "title" : "Moving home","badge":"11"],["image" : "insurance", "title" : "Insurance","badge":"6"],["image" : "tradesperson_deals", "title" : "Tradespeople","badge":"9"],["image" : "vehicle_deals", "title" : "Vehicle","badge":"3"]]
         */
        switch indexPath.row {
       
        case 0:
            break
        case 1:
            if isDealToUnlock{
                if let initVC = self.storyboard?.instantiateViewController(withIdentifier: "UnlockDealDetailVC") as? UnlockDealDetailVC{
                    initVC.headerViewData = DealsToUnlockData().getDataForHeader(dealName: "Insurance", isDealToUnlock: isDealToUnlock)
                    initVC.arrScrollData = DealsToUnlockData().getDataForView(dealName: "Insurance", isDealToUnlock: isDealToUnlock)
                    self.navigationController?.pushViewController(initVC, animated: true)
                }
                
            }else{
                let storyBoard = UIStoryboard(name: "UnlockedDeal", bundle: Bundle.main)
                let initVC = storyBoard.instantiateViewController(withIdentifier: "WebDealDetailVC") as! WebDealDetailVC
                initVC.headerViewData = DealsToUnlockData().getDataForHeader(dealName: "Insurance", isDealToUnlock: isDealToUnlock)
                initVC.arrScrollData = DealsToUnlockData().getDataForView(dealName: "Insurance", isDealToUnlock: isDealToUnlock)
                self.navigationController?.pushViewController(initVC, animated: true)
            }
           
            break
        case 2:
            if isDealToUnlock{
                if let initVC = self.storyboard?.instantiateViewController(withIdentifier: "UnlockDealDetailVC") as? UnlockDealDetailVC{
                    initVC.headerViewData = DealsToUnlockData().getDataForHeader(dealName: "TradesPeople", isDealToUnlock: isDealToUnlock)
                    initVC.arrScrollData = DealsToUnlockData().getDataForView(dealName: "TradesPeople", isDealToUnlock: isDealToUnlock)
                    self.navigationController?.pushViewController(initVC, animated: true)
                }
            }else{
                let storyBoard = UIStoryboard(name: "UnlockedDeal", bundle: Bundle.main)
                let initVC = storyBoard.instantiateViewController(withIdentifier: "WebDealDetailVC") as! WebDealDetailVC
                initVC.headerViewData = DealsToUnlockData().getDataForHeader(dealName: "TradesPeople", isDealToUnlock: isDealToUnlock)
                initVC.arrScrollData = DealsToUnlockData().getDataForView(dealName: "TradesPeople", isDealToUnlock: isDealToUnlock)
                self.navigationController?.pushViewController(initVC, animated: true)
            }
            break
        default:
            break
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
                
                headerData = ["image" : "info_ins","title" : "Use a deal you've unlocked","desc" : "Insurance If you have Whoop! Me Happy\ncode you can boost your savings"]
            }
        case "TradesPeople":
            if isDealToUnlock{
                headerData = ["image" : "tradeperson","title" : "Tradesperson","desc" : " Here are your home's tradespeople deals. Tap the ones you want to unlock this month","bgImage" : "bg_tra"]
            }else{
                headerData = ["image" : "info_tra","title" : "Use a deal you've unlocked","desc" : "Tradesperson If you have Whoop! Me Happy\ncode you can boost your savings"]
            }
            
            
        case "Technology":
            if isDealToUnlock{
                headerData = ["image" : "info_tra","title" : "Tradesperson","desc" : "Your home's Whoop! Button has 1 exclusive Tradesperson deal added to it. Unlock and your local Whoop! expert tradespeople"]
            }else{
                headerData = ["image" : "info_ins","title" : "Tradesperson","desc" : "Everyone you live with canuse this deal", "message":"Expires in 45 days"]
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
            
            
        case "TradesPeople":
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
            arrScrollData = [
                ["image" : "blue_plane","selected_image" :"gray_plane","title" : "Travel Insurance".localized,"desc":"This is your home's travel insurance deal".localized,"bgImage" : "bg"],
                
                ["image" : "blue_travel_medical","selected_image" :"gray_travel_medical","title" : "Travel Insurance\n( Medical conditions )".localized,"desc":"This is your home's travel insurance (Medical conditions) deal".localized,"bgImage" : "bg"],
                
                ["image" : "blue_car_break","selected_image" :"gray_car_break","title" : "Car breakdown".localized,"desc":"This is your home's Car breakdown deal".localized,"bgImage" : "bg"]]
        default:
            return arrScrollData
        }
        return arrScrollData
    }
}

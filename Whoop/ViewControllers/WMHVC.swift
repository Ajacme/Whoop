
//
//  WMHVC.swift
//  Whoop!
//
//  Created by Maulik Vinodbhai Vora on 18/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit


class BrandListHeader_Data : NSObject {
    var title : String = ""
    var desc : String = ""
    var category : String = ""
    var subcategory : String = ""
    
    
    override init() {
        
    }
    
    init(title: String, desc: String, category: String, subcategory: String) {
        
        self.title = title
        self.desc = desc
        self.category = category
        self.subcategory = subcategory
    }
}

class BrandListHeaderView : UIView {
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var headerSearchTextField: UITextField!
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        //        setup()
    }
    required init(coder aDecoder:NSCoder) {
        super.init(coder:aDecoder)!
        //        setup()
    }
    
}
//MARK: - UITableViewCell Class
class WMHtblCellVC: UITableViewCell
{
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    
    @IBOutlet weak var imgbgLogo: UIImageView!
    
    @IBOutlet weak var lblDesc: UILabel!
    
    @IBOutlet weak var btnOurWhoopMeHappy: UIButton!
}

class WMHVC: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var tblDataList: UITableView!
    
    //tblHeader
    @IBOutlet var viewtblHeader: BrandListHeaderView!
    @IBOutlet weak var txttblHeader: UITextField!
    
    //alloc tablelist array
    var arrtblData = [[String : Any]]()
    
    var CellIdentifier = "WMHtblCell"
    
    var headerViewData = [String : Any]()
    var headerData = BrandListHeader_Data()
    
    var arrScrollData = [[String : Any]]()
    var  arrInsuranceData = [Insurance_data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add tableview header
        tblDataList.tableHeaderView = viewtblHeader
        
        //settblListData
        arrtblData  = [["image" : "vodafone","image_bg" : "background","selected_image" :"","title" : "Vodafone","Desc":""],["image" : "goodtogo","image_bg" : "goodtogo_bg","selected_image" :"","title" : "Good to go","Desc":"Travel Insurance that is as unique as you are"],["image" : "coreforyoulogo","image_bg" : "coreforyou_bg","selected_image" :"","title" : "Cover for you","Desc":"Travel Insurance with cover for medical conditions and no age limit"]]
        
        let attributesDictionary = [NSAttributedStringKey.foregroundColor: UIColor (red: 255/255.0, green: 79/255.0, blue: 0/255.0, alpha: 0.4)]
        txttblHeader.attributedPlaceholder = NSAttributedString(string: "Search for your favourite brand",attributes:attributesDictionary)
        
        if headerViewData.count >= 0 {
            headerData.title = headerViewData["title"] as! String
            headerData.category = headerViewData["category"] as! String
            headerData.subcategory = headerViewData["subcategory"] as! String
            self.setUpHeader()
        }
        
        if arrScrollData.count <= 0{
            arrScrollData  = [
                ["image" : "blue_plane","selected_bg" :"","title" : "Travel Insurance".localized,"desc":"Everyone you live with canuse this deal".localized , "message" : "Expires in 45 days".localized],
                ["image" : "blue_travel_medical","selected_bg" :"","title" : "Travel Insurance with Medical".localized,"desc":"Everyone you live with canuse this deal".localized , "message" : "Expires in 45 days".localized],
                ["image" : "blue_car_break","selected_bg" :"","title" : "Car breakdown".localized,"desc":"Everyone you live with canuse this deal".localized , "message" : "Expires in 45 days".localized]
            ]
            
        }
        for dic in arrScrollData
        {
            let tableData = Insurance_data()
            tableData.title = dic["title"] as! String
            tableData.imageName = dic["image"] as! String
//            tableData.displayMessage = dic["message"] as! String
            tableData.desc = dic["desc"] as! String
            tableData.isGetQuotes = false
//            tableData.selectedBGImage = dic["selected_image"] as! String
            tableData.bgImage = dic["bgImage"] as! String
            arrInsuranceData.append(tableData)
        }
        
    }
    
    func setUpHeader(){
        let dic = headerData
        print(dic.category)
        print(dic.subcategory)
        
        viewtblHeader.headerTitleLabel.text = dic.title
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:- UIButton Click
    @IBAction func btnOurWhoopMeHappy(_ sender: UIButton) {
        /*
         if let objSeeCodeVC = storyboard.instantiateViewController(withIdentifier: "WMHVC") as? WMHVC{
         let dic = headerData
         objSeeCodeVC.arrScrollData = BrandList().getDataForView(dealName: headerData.category)
         objSeeCodeVC.headerViewData = BrandList().getDataForHeader(dealName: headerData.category, data: arrInsuranceData[sender.tag])
         self.navigationController?.pushViewController(objSeeCodeVC, animated: true)
         }
 */
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "brandPriceListVC") as! brandPriceListVC
        
        let dic = headerData
        print(dic)
        controller.headerViewData = PriceList().getDataForHeader(category: dic.category, subcategory: dic.subcategory, atIndex: sender.tag)
        controller.arrScrollData = PriceList().getDataForView(category: dic.category, subcategory: dic.subcategory, atIndex: sender.tag)
        
        self.navigationController?.pushViewController(controller, animated: true)
        
//        if (sender as AnyObject).tag == 2{
//            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "brandPriceListVC") as! brandPriceListVC
//            self.navigationController?.pushViewController(secondViewController, animated: true)
//        }
        
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK:- UITextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true;
    }
}

//MARK: - Tableview Delegates And Datasource
extension WMHVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //array count row
//        return arrtblData.count
        return arrInsuranceData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WMHtblCell") as! WMHtblCellVC
        
        let dic = arrInsuranceData[indexPath.row]
        
        //set Cell Value
        cell.lblTitle.text = dic.title//dic["title"] as? String
        cell.lblDesc.text = dic.desc//dic["Desc"] as? String
        cell.imgLogo.image = UIImage(named: dic.imageName)//UIImage(named:(dic["image"] as? String)!)
        cell.imgbgLogo.image = UIImage(named: dic.bgImage)//UIImage(named:(dic["image_bg"] as? String)!)
        cell.updateConstraintsIfNeeded()
        
        cell.btnOurWhoopMeHappy.tag = indexPath.row
        
        return cell
    }
}

class PriceList {
    
    public func getDataForHeader(category:String, subcategory: String, atIndex:Int) ->[String : Any]{
        print(category)
        print(subcategory)
        
        /* Banner Image , Logo Image, Title Text*/
 
 
        var headerData = [String : Any]()
        
        /* Header Data Contain (Title, Logo Image(imageName), bannerImage, category, subcategory)
 
         headerData.title = headerViewData["title"] as! String
         headerData.imageName = headerViewData["imageName"] as! String
         headerData.bannerImage = headerViewData["bannerImage"] as! String
         headerData.category = headerViewData["category"] as! String
         headerData.subcategory = headerViewData["subcategory"] as! String
 */
        switch category {
        case "Insurance":
            
            switch subcategory {
            case "Travel Insurance":
                switch atIndex {
                case 0:
                    headerData = ["title" : "Use a deal you've unlocked", "imageName": "aspect_co_uk", "bannerImage": "bg_mov", "category": "Insurance", "subcategory": "subcategory"]
                    break
                    
                case 1:
                    headerData = ["title" : "Use a deal you've unlocked"]
                    break
                    
                case 2:
                    headerData = ["title" : "Use a deal you've unlocked"]
                    break
                    
                default:
                    break
                }
                
//                headerData = ["title" : "Use a deal you've unlocked"]
                
            case "Travel Insurance\n( Medical conditions )":
                switch atIndex {
                case 0:
                    headerData = ["title" : "Use a deal you've unlocked"]
                    break
                    
                case 1:
                    headerData = ["title" : "Use a deal you've unlocked"]
                    break
                    
                case 2:
                    headerData = ["title" : "Use a deal you've unlocked"]
                    break
                    
                default:
                    break
                }
                
//                headerData = ["title" : "Use a deal you've unlocked"]
                
            case "Car breakdown":
                
                switch atIndex {
                case 0:
                    headerData = ["title" : "Here are some of our Whoop! Me Happy Prices", "imageName": "Rescue_co_uk", "bannerImage": "bg_tec", "category": "Insurance", "subcategory": "Car breakdown"]
                                   
                    break
                    
                default:
                    break
                }
                
//                headerData = ["title" : "Use a deal you've unlocked"]
                
            default:
                return headerData
            }
//            headerData = ["title" : "Use a deal you've unlocked"]
            
        case "Tradespeople":
            
            switch subcategory {
                
            case "Plumber":
                
                switch atIndex {
                case 0:
                    headerData = ["title" : "Here are some of our Whoop! Me Happy Prices", "imageName": "rightArrow", "bannerImage": "yellow_banner", "category": "Tradespeople", "subcategory": "Plumber"]
                    break
                    
                    
                default:
                    break
                }
                
//                headerData = ["title" : "Use a deal you've unlocked"]
                
            default:
                return headerData
            }
            
//            headerData = ["title" : "Use a deal you've unlocked"]
            
        case "Technology":
            
            switch subcategory {
            case "Broadband":
                
                switch atIndex {
                case 0:
                    headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                    break
                    
                case 1:
                    headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                    break
                    
                case 2:
                    headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                    break
                    
                default:
                    break
                }
                
//                headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                
            case "Mobile":
                
                switch atIndex {
                case 0:
                    headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                    break
                    
                case 1:
                    headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                    break
                    
                case 2:
                    headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                    break
                    
                default:
                    break
                }
                
//                headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                
            default:
                return headerData
            }
            
//            headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
            
        case "Moving Home":
            
            switch subcategory {
            case "Conveyancer Deal":
                
                switch atIndex {
                case 0:
                    headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                    break
                    
                case 1:
                    headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                    break
                    
                case 2:
                    headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                    break
                    
                default:
                    break
                }
                
//                headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                
            case "Home Removal Deal":
                
                switch atIndex {
                case 0:
                    headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                    break
                    
                case 1:
                    headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                    break
                    
                case 2:
                    headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                    break
                    
                default:
                    break
                }
                
//                headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                
            default:
                return headerData
            }
//            headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
            
        case "My Vehicle":
            
            switch subcategory {
            case "Car MOT and Services Deal":
                
                switch atIndex {
                case 0:
                    headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                    break
                    
                case 1:
                    headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                    break
                    
                case 2:
                    headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                    break
                    
                default:
                    break
                }
                
//                headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                
            case "Car Tyres Deal":
                
                switch atIndex {
                case 0:
                    headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                    break
                    
                case 1:
                    headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                    break
                    
                case 2:
                    headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                    break
                    
                default:
                    break
                }
                
//                headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
                
            default:
                return headerData
            }
            
//            headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
            
        default:
            return headerData
        }
        return headerData
    }
    
    public func getDataForView(category:String, subcategory: String, atIndex:Int) ->[[String : Any]] {
        
        print(category)
        print(subcategory)
        /* Banner Image, Logo Image, Title Text, Number Of Days Label, Number of person, discounted price lable, normal price lable */
        /*
            var bannerImage : String = ""
            var imageName : String = ""
            var title : String = ""
            var numberOfDays : String = ""
            var numberOfAdults : String = ""
            var price : String = ""
            var normalPrice : String = ""
         */
        var arrScrollData = [[String : Any]] ()
        switch category {
        case "Insurance":
            
            switch subcategory {
            case "Travel Insurance":
                
                switch atIndex {
                case 0:
                    arrScrollData = [["imageName" : "whoop!_me_happy_face","title" : "UK breakdown policy".localized,"bannerImage" : "bg_tec", "numberOfDays": "", "numberOfAdults": "1 Car", "price": "£36", "normalPrice": " normal: £47"]]
                    
                    break
                    
                default:
                    break
                }
                
                
                
                /*arrScrollData = [["image" : "whoop!_me_happy_face","selected_image" :"whoop!_me_happy_face","title" : "Start Rescue".localized,"desc":"We have five different levels of cheap breakdown cover for you to choose from".localized,"bgImage" : "orange_banner", "category":"Insurance"],
                                 
                                 ["image" : "coreforyoulogo","selected_image" :"coreforyoulogo","title" : "Cover For You".localized,"desc":"Travel Insurance that is as unique as you are".localized,"bgImage" : "bg_brand_broad", "category":"Insurance"],
                                 
                                 ["image" : "goodtogo","selected_image" :"goodtogo","title" : "Good Go Insurence".localized,"desc":"Travel Insurance with cover for medical conditions and no age limit".localized,"bgImage" : "goodtogo_bg", "category":"Insurance"]
                ]*/
                
            case "Travel Insurance\n( Medical conditions )":
                
                switch atIndex {
                case 0:
                    arrScrollData = [["imageName" : "whoop!_me_happy_face","title" : "UK breakdown policy".localized,"bannerImage" : "bg_tec", "numberOfDays": "", "numberOfAdults": "1 Car", "price": "£36", "normalPrice": " normal: £47"]]
    
                    break
                    
                
                    
                default:
                    break
                }
                
                /*arrScrollData = [["image" : "whoop!_me_happy_face","selected_image" :"whoop!_me_happy_face","title" : "Start Rescue".localized,"desc":"We have five different levels of cheap breakdown cover for you to choose from".localized,"bgImage" : "orange_banner", "category":"Insurance"],
                                 
                                 ["image" : "coreforyoulogo","selected_image" :"coreforyoulogo","title" : "Cover For You".localized,"desc":"Travel Insurance that is as unique as you are".localized,"bgImage" : "bg_brand_broad", "category":"Insurance"],
                                 
                                 ["image" : "goodtogo","selected_image" :"goodtogo","title" : "Good Go Insurence".localized,"desc":"Travel Insurance with cover for medical conditions and no age limit".localized,"bgImage" : "goodtogo_bg", "category":"Insurance"]
                ]*/
                
            case "Car breakdown":
                
                switch atIndex {
                case 0:
                    
                    arrScrollData = [["imageName" : "whoop!_me_happy_face","title" : "UK breakdown policy".localized,"bannerImage" : "bg_tec", "numberOfDays": "", "numberOfAdults": "1 Car", "price": "£36", "normalPrice": " normal: £47"]]
                    
                    break
                    
                    
                default:
                    break
                }
                
                
                /*arrScrollData = [["image" : "whoop!_me_happy_face","selected_image" :"whoop!_me_happy_face","title" : "Start Rescue".localized,"desc":"We have five different levels of cheap breakdown cover for you to choose from".localized,"bgImage" : "orange_banner", "category":"Insurance"],
                                 
                                 ["image" : "coreforyoulogo","selected_image" :"coreforyoulogo","title" : "Cover For You".localized,"desc":"Travel Insurance that is as unique as you are".localized,"bgImage" : "bg_brand_broad", "category":"Insurance"],
                                 
                                 ["image" : "goodtogo","selected_image" :"goodtogo","title" : "Good Go Insurence".localized,"desc":"Travel Insurance with cover for medical conditions and no age limit".localized,"bgImage" : "goodtogo_bg", "category":"Insurance"]
                ]*/
                
            default:
                return arrScrollData
            }
        
            //           orange_bg
            /*arrScrollData = [["image" : "whoop!_me_happy_face","selected_image" :"whoop!_me_happy_face","title" : "Start Rescue".localized,"desc":"We have five different levels of cheap breakdown cover for you to choose from".localized,"bgImage" : "orange_banner", "category":"Insurance"],
                             
                             ["image" : "coreforyoulogo","selected_image" :"coreforyoulogo","title" : "Cover For You".localized,"desc":"Travel Insurance that is as unique as you are".localized,"bgImage" : "bg_brand_broad", "category":"Insurance"],
                             
                             ["image" : "goodtogo","selected_image" :"goodtogo","title" : "Good Go Insurence".localized,"desc":"Travel Insurance with cover for medical conditions and no age limit".localized,"bgImage" : "goodtogo_bg", "category":"Insurance"]
            ]*/
            
        case "Tradespeople":
            
            switch subcategory {
                
            case "Plumber":
                switch atIndex {
                case 0:
                     arrScrollData = [["imageName" : "plumber_thumbnail","title" : "Fixed Fee Boiler Repair".localized,"bannerImage" : "bg_tec", "numberOfDays": "", "numberOfAdults": "includes labour and parts", "price": "£149.00", "normalPrice": " normal: £175"]]
                    break
                    
                default:
                    break
                }
                
                /*arrScrollData = [
                    ["image" : "plumber","selected_image" :"plumber_white","title" : "Plumber".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_tec", "message" : "Uses 1 credit", "category":"Tradespeople"]]*/
                
            default:
                return arrScrollData
            }
            /*arrScrollData = [
                ["image" : "plumber","selected_image" :"plumber_white","title" : "Plumber".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_tec", "message" : "Uses 1 credit", "category":"Tradespeople"]]*/
            
        case "Technology":
            
            switch subcategory{
                
            case "Broadband":
                
                switch atIndex {
                case 0:
                    arrScrollData = [
                        ["image" : "BT_home","selected_image" :"BT_home","title" : "Broadband".localized,"desc":"".localized,"bgImage" : "bg_tec", "category":"Technology"]]
                    break
                    
                case 1:
                    arrScrollData = [
                        ["image" : "BT_home","selected_image" :"BT_home","title" : "Broadband".localized,"desc":"".localized,"bgImage" : "bg_tec", "category":"Technology"]]
                    break
                    
                case 2:
                    arrScrollData = [
                        ["image" : "BT_home","selected_image" :"BT_home","title" : "Broadband".localized,"desc":"".localized,"bgImage" : "bg_tec", "category":"Technology"]]
                    break
                    
                default:
                    break
                }
               
                /*arrScrollData = [
                    ["image" : "BT_home","selected_image" :"BT_home","title" : "Broadband".localized,"desc":"".localized,"bgImage" : "bg_tec", "category":"Technology"]]*/
       ///////////////////////////////////////////////
            case "Mobile":
                
                switch atIndex {
                case 0:
                    arrScrollData = [
                        ["image" : "BT_home","selected_image" :"BT_home","title" : "Broadband".localized,"desc":"".localized,"bgImage" : "bg_tec", "category":"Technology"]]
                    break
                    
                case 1:
                    arrScrollData = [
                        ["image" : "BT_home","selected_image" :"BT_home","title" : "Broadband".localized,"desc":"".localized,"bgImage" : "bg_tec", "category":"Technology"]]
                    break
                    
                case 2:
                    arrScrollData = [
                        ["image" : "BT_home","selected_image" :"BT_home","title" : "Broadband".localized,"desc":"".localized,"bgImage" : "bg_tec", "category":"Technology"]]
                    break
                    
                default:
                     return arrScrollData
                }
                
//                arrScrollData = [
//                    ["image" : "BT_home","selected_image" :"BT_home","title" : "Broadband".localized,"desc":"".localized,"bgImage" : "bg_tec", "category":"Technology"]]
                
            default:
                return arrScrollData
            }
            
            
            /*arrScrollData = [
                ["image" : "BT_home","selected_image" :"BT_home","title" : "Broadband".localized,"desc":"".localized,"bgImage" : "bg_tec", "category":"Technology"]]*/
            
        case "My Vehicle":
            
            switch subcategory {
                
            case "Car MOT and Services Deal":
                switch atIndex {
                case 0:
                    arrScrollData = [
                        ["image" : "myvehicles","selected_image" :"gray_myvehicles","title" : "Car MOT and Services Deal".localized,"desc":"This is your home's local plumber deal".localized,"bgImage" : "bg_veh", "message" : "Expires in 45 days", "category":"My Vehicle"],
                        ["image" : "cartyres","selected_image" :"gray_cartyres","title" : "Car Tyres Deal".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_veh", "message" : "Uses 1 credit", "category":"My Vehicle"]]
                    break
                    
                case 1:
                    arrScrollData = [
                        ["image" : "myvehicles","selected_image" :"gray_myvehicles","title" : "Car MOT and Services Deal".localized,"desc":"This is your home's local plumber deal".localized,"bgImage" : "bg_veh", "message" : "Expires in 45 days", "category":"My Vehicle"],
                        ["image" : "cartyres","selected_image" :"gray_cartyres","title" : "Car Tyres Deal".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_veh", "message" : "Uses 1 credit", "category":"My Vehicle"]]
                    break
                    
                case 2:
                    arrScrollData = [
                        ["image" : "myvehicles","selected_image" :"gray_myvehicles","title" : "Car MOT and Services Deal".localized,"desc":"This is your home's local plumber deal".localized,"bgImage" : "bg_veh", "message" : "Expires in 45 days", "category":"My Vehicle"],
                        ["image" : "cartyres","selected_image" :"gray_cartyres","title" : "Car Tyres Deal".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_veh", "message" : "Uses 1 credit", "category":"My Vehicle"]]
                    break
                    
                default:
                    break
                }
               /* arrScrollData = [
                    ["image" : "myvehicles","selected_image" :"gray_myvehicles","title" : "Car MOT and Services Deal".localized,"desc":"This is your home's local plumber deal".localized,"bgImage" : "bg_veh", "message" : "Expires in 45 days", "category":"My Vehicle"],
                    ["image" : "cartyres","selected_image" :"gray_cartyres","title" : "Car Tyres Deal".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_veh", "message" : "Uses 1 credit", "category":"My Vehicle"]]*/
                
            case "Car Tyres Deal":
                switch atIndex {
                case 0:
                    arrScrollData = [
                        ["image" : "myvehicles","selected_image" :"gray_myvehicles","title" : "Car MOT and Services Deal".localized,"desc":"This is your home's local plumber deal".localized,"bgImage" : "bg_veh", "message" : "Expires in 45 days", "category":"My Vehicle"],
                        ["image" : "cartyres","selected_image" :"gray_cartyres","title" : "Car Tyres Deal".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_veh", "message" : "Uses 1 credit", "category":"My Vehicle"]]
                    break
                    
                case 1:
                    arrScrollData = [
                        ["image" : "myvehicles","selected_image" :"gray_myvehicles","title" : "Car MOT and Services Deal".localized,"desc":"This is your home's local plumber deal".localized,"bgImage" : "bg_veh", "message" : "Expires in 45 days", "category":"My Vehicle"],
                        ["image" : "cartyres","selected_image" :"gray_cartyres","title" : "Car Tyres Deal".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_veh", "message" : "Uses 1 credit", "category":"My Vehicle"]]
                    break
                    
                case 2:
                    arrScrollData = [
                        ["image" : "myvehicles","selected_image" :"gray_myvehicles","title" : "Car MOT and Services Deal".localized,"desc":"This is your home's local plumber deal".localized,"bgImage" : "bg_veh", "message" : "Expires in 45 days", "category":"My Vehicle"],
                        ["image" : "cartyres","selected_image" :"gray_cartyres","title" : "Car Tyres Deal".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_veh", "message" : "Uses 1 credit", "category":"My Vehicle"]]
                    break
                    
                default:
                    break
                }
                
                /*arrScrollData = [
                    ["image" : "myvehicles","selected_image" :"gray_myvehicles","title" : "Car MOT and Services Deal".localized,"desc":"This is your home's local plumber deal".localized,"bgImage" : "bg_veh", "message" : "Expires in 45 days", "category":"My Vehicle"],
                    ["image" : "cartyres","selected_image" :"gray_cartyres","title" : "Car Tyres Deal".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_veh", "message" : "Uses 1 credit", "category":"My Vehicle"]]*/
                
            default:
                return arrScrollData
            }
            /*arrScrollData = [
                ["image" : "myvehicles","selected_image" :"gray_myvehicles","title" : "Car MOT and Services Deal".localized,"desc":"This is your home's local plumber deal".localized,"bgImage" : "bg_veh", "message" : "Expires in 45 days", "category":"My Vehicle"],
                ["image" : "cartyres","selected_image" :"gray_cartyres","title" : "Car Tyres Deal".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_veh", "message" : "Uses 1 credit", "category":"My Vehicle"]]*/
            
        case "Moving Home":
            
            switch subcategory {
            case "Conveyancer Deal":
                switch atIndex {
                case 0:
                    arrScrollData = [
                        ["image" : "conveyancer_deal","selected_image" :"gray_conveyancer_deal","title" : "Conveyancer Deal".localized,"desc":"This is your home's local Conveyancer  deal".localized,"bgImage" : "bg_mov", "message" : "Expires in 45 days", "category":"Moving Home"],
                        ["image" : "moving_home","selected_image" :"geay_home_removal_deal","title" : "Home Removal Deal".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_mov", "message" : "Uses 1 credit", "category":"Moving Home"]]
                    break
                    
                case 1:
                    arrScrollData = [
                        ["image" : "conveyancer_deal","selected_image" :"gray_conveyancer_deal","title" : "Conveyancer Deal".localized,"desc":"This is your home's local Conveyancer  deal".localized,"bgImage" : "bg_mov", "message" : "Expires in 45 days", "category":"Moving Home"],
                        ["image" : "moving_home","selected_image" :"geay_home_removal_deal","title" : "Home Removal Deal".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_mov", "message" : "Uses 1 credit", "category":"Moving Home"]]
                    break
                    
                case 2:
                    arrScrollData = [
                        ["image" : "conveyancer_deal","selected_image" :"gray_conveyancer_deal","title" : "Conveyancer Deal".localized,"desc":"This is your home's local Conveyancer  deal".localized,"bgImage" : "bg_mov", "message" : "Expires in 45 days", "category":"Moving Home"],
                        ["image" : "moving_home","selected_image" :"geay_home_removal_deal","title" : "Home Removal Deal".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_mov", "message" : "Uses 1 credit", "category":"Moving Home"]]
                    break
                    
                default:
                    break
                }
                /*arrScrollData = [
                    ["image" : "conveyancer_deal","selected_image" :"gray_conveyancer_deal","title" : "Conveyancer Deal".localized,"desc":"This is your home's local Conveyancer  deal".localized,"bgImage" : "bg_mov", "message" : "Expires in 45 days", "category":"Moving Home"],
                    ["image" : "moving_home","selected_image" :"geay_home_removal_deal","title" : "Home Removal Deal".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_mov", "message" : "Uses 1 credit", "category":"Moving Home"]]*/
                
            case "Home Removal Deal":
                switch atIndex {
                case 0:
                    arrScrollData = [
                        ["image" : "conveyancer_deal","selected_image" :"gray_conveyancer_deal","title" : "Conveyancer Deal".localized,"desc":"This is your home's local Conveyancer  deal".localized,"bgImage" : "bg_mov", "message" : "Expires in 45 days", "category":"Moving Home"],
                        ["image" : "moving_home","selected_image" :"geay_home_removal_deal","title" : "Home Removal Deal".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_mov", "message" : "Uses 1 credit", "category":"Moving Home"]]
                    break
                    
                case 1:
                    arrScrollData = [
                        ["image" : "conveyancer_deal","selected_image" :"gray_conveyancer_deal","title" : "Conveyancer Deal".localized,"desc":"This is your home's local Conveyancer  deal".localized,"bgImage" : "bg_mov", "message" : "Expires in 45 days", "category":"Moving Home"],
                        ["image" : "moving_home","selected_image" :"geay_home_removal_deal","title" : "Home Removal Deal".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_mov", "message" : "Uses 1 credit", "category":"Moving Home"]]
                    break
                    
                case 2:
                    arrScrollData = [
                        ["image" : "conveyancer_deal","selected_image" :"gray_conveyancer_deal","title" : "Conveyancer Deal".localized,"desc":"This is your home's local Conveyancer  deal".localized,"bgImage" : "bg_mov", "message" : "Expires in 45 days", "category":"Moving Home"],
                        ["image" : "moving_home","selected_image" :"geay_home_removal_deal","title" : "Home Removal Deal".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_mov", "message" : "Uses 1 credit", "category":"Moving Home"]]
                    break
                    
                default:
                    break
                }
                /*arrScrollData = [
                    ["image" : "conveyancer_deal","selected_image" :"gray_conveyancer_deal","title" : "Conveyancer Deal".localized,"desc":"This is your home's local Conveyancer  deal".localized,"bgImage" : "bg_mov", "message" : "Expires in 45 days", "category":"Moving Home"],
                    ["image" : "moving_home","selected_image" :"geay_home_removal_deal","title" : "Home Removal Deal".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_mov", "message" : "Uses 1 credit", "category":"Moving Home"]]*/
                
            default:
                return arrScrollData
            }
            /*arrScrollData = [
                ["image" : "conveyancer_deal","selected_image" :"gray_conveyancer_deal","title" : "Conveyancer Deal".localized,"desc":"This is your home's local Conveyancer  deal".localized,"bgImage" : "bg_mov", "message" : "Expires in 45 days", "category":"Moving Home"],
                ["image" : "moving_home","selected_image" :"geay_home_removal_deal","title" : "Home Removal Deal".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_mov", "message" : "Uses 1 credit", "category":"Moving Home"]]*/
            
        default:
            return arrScrollData
        }
        return arrScrollData
    }
    
}
/*
 
 class BrandList {
 
 // Header View Data
 public func getDataForHeader(dealName:String) ->[String : Any]{
 var headerData = [String : Any]()
 print(dealName)
 switch dealName {
 
 case "Insurance":
 headerData = ["title" : "Use a deal you've unlocked"]
 
 case "Tradespeople":
 headerData = ["title" : "Use a deal you've unlocked"]
 
 case "Technology":
 headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
 case "Moving Home":
 headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
 case "My Vehicle":
 headerData = ["title" : "These brands can't wait to Whoop! You Happy"]
 
 default:
 return headerData
 }
 
 return headerData
 }
 public func getDataForView(dealName:String) ->[[String : Any]]{
 var arrScrollData = [[String : Any]] ()
 switch dealName {
 case "Insurance":
 //           orange_bg
 arrScrollData = [["image" : "whoop!_me_happy_face","selected_image" :"whoop!_me_happy_face","title" : "Start Rescue".localized,"desc":"We have five different levels of cheap breakdown cover for you to choose from".localized,"bgImage" : "orange_banner", "category":"Insurance"],
 
 ["image" : "coreforyoulogo","selected_image" :"coreforyoulogo","title" : "Cover For You".localized,"desc":"Travel Insurance that is as unique as you are".localized,"bgImage" : "bg_brand_broad", "category":"Insurance"],
 
 ["image" : "goodtogo","selected_image" :"goodtogo","title" : "Good Go Insurence".localized,"desc":"Travel Insurance with cover for medical conditions and no age limit".localized,"bgImage" : "goodtogo_bg", "category":"Insurance"]
 ]
 
 case "Tradespeople":
 
 arrScrollData = [
 ["image" : "plumber","selected_image" :"plumber_white","title" : "Plumber".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_tec", "message" : "Uses 1 credit", "category":"Tradespeople"]]
 
 case "Technology":
 arrScrollData = [
 ["image" : "BT_home","selected_image" :"BT_home","title" : "Broadband".localized,"desc":"".localized,"bgImage" : "bg_tec", "category":"Technology"]]
 
 case "My Vehicle":
 arrScrollData = [
 ["image" : "myvehicles","selected_image" :"gray_myvehicles","title" : "Car MOT and Services Deal".localized,"desc":"This is your home's local plumber deal".localized,"bgImage" : "bg_veh", "message" : "Expires in 45 days", "category":"My Vehicle"],
 ["image" : "cartyres","selected_image" :"gray_cartyres","title" : "Car Tyres Deal".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_veh", "message" : "Uses 1 credit", "category":"My Vehicle"]]
 
 case "Moving Home":
 
 arrScrollData = [
 ["image" : "conveyancer_deal","selected_image" :"gray_conveyancer_deal","title" : "Conveyancer Deal".localized,"desc":"This is your home's local Conveyancer  deal".localized,"bgImage" : "bg_mov", "message" : "Expires in 45 days", "category":"Moving Home"],
 ["image" : "moving_home","selected_image" :"geay_home_removal_deal","title" : "Home Removal Deal".localized,"desc":"You'll only use this credit/deal if you buy a policy".localized,"bgImage" : "bg_mov", "message" : "Uses 1 credit", "category":"Moving Home"]]
 
 default:
 return arrScrollData
 }
 return arrScrollData
 }
 }
 */


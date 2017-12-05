
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
    
    override init() {
        
    }
    
    init(title: String, desc: String) {
        
        self.title = title
        self.desc = desc
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
            tableData.displayMessage = dic["message"] as! String
            tableData.desc = dic["desc"] as! String
            tableData.isGetQuotes = false
            tableData.selectedBGImage = dic["selected_image"] as! String
            tableData.bgImage = dic["bgImage"] as! String
            arrInsuranceData.append(tableData)
        }
        
    }
    
    func setUpHeader(){
        let dic = headerData
        viewtblHeader.headerTitleLabel.text = dic.title
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:- UIButton Click
    @IBAction func btnOurWhoopMeHappy(_ sender: Any) {
        if (sender as AnyObject).tag == 2{
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "brandPriceListVC") as! brandPriceListVC
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
        
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


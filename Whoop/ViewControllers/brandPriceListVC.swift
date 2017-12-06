//
//  brandPriceListVC.swift
//  Whoop!
//
//  Created by Maulik Vinodbhai Vora on 18/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

//MARK: - Price Data Class
class Price_Data : NSObject {
    
    var bannerImage : String = ""
    var imageName : String = ""
    var title : String = ""
    var numberOfDays : String = ""
    var numberOfAdults : String = ""
    var price : String = ""
    var normalPrice : String = ""
    
    override init() {
        
    }
    
    init(title : String, price : String, normalPrice : String, numberOfAdults: String, numberOfDays: String, imageName: String, bannerImage: String) {
        
        self.title = title
        self.price = price
        self.normalPrice = normalPrice
        self.numberOfAdults = numberOfAdults
        self.numberOfDays = numberOfDays
        self.imageName = imageName
        self.bannerImage = bannerImage
    }
}

class BrandPriceHeaderView : UIView {
   
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        //        setup()
    }
    required init(coder aDecoder:NSCoder) {
        super.init(coder:aDecoder)!
        //        setup()
    }
    
}

//MARK: - Tableview Header Data Class
class BrandPriceHeader_Data : NSObject {
    var title : String = ""
    var bannerImage : String = ""
    var imageName : String = ""
    var category : String = ""
    var subcategory : String = ""
    
    
    override init() {
        
    }
    
    init(title: String, imageName: String, bannerImage: String, category: String, subcategory: String) {
        
        self.title = title
        self.imageName = imageName
        self.bannerImage = bannerImage
        self.category = category
        self.subcategory = subcategory
    }
}
//MARK: - UITableViewCell Class
class tblbrandPriceCellVC: UITableViewCell
{
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblNormalPrice: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet weak var lblNumberOfPerson: UILabel!
    
    
}


class brandPriceListVC: UIViewController {
    @IBOutlet weak var tblDataList: UITableView!
    
    //tblHeader
    @IBOutlet var viewtblHeader: BrandPriceHeaderView!
    
    
    //alloc tablelist array
    var arrtblData = [[String : Any]]()
    
    var headerViewData = [String : Any]()
    var headerData = BrandPriceHeader_Data()
    
    var arrScrollData = [[String : Any]]()
    var  arrPriceData = [Price_Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //add tableview header
        tblDataList.tableHeaderView = viewtblHeader
        
        //settblListData
        
    
        arrtblData  = [["image" : "brand1","title" : "Annual Multi Trip Policy", "adult" : "1 adult", "price" : "£57.86","normalprice" : "normal: £75.00"],["image" : "brand2","title" : "Europe Single Trip Policy", "adult" : "7 days, 1 adult", "price" : "£34.00","normalprice" : "normal: £39.90"]]
        
        if headerViewData.count >= 0 {
            headerData.title = headerViewData["title"] as! String
            headerData.imageName = headerViewData["imageName"] as! String
            headerData.bannerImage = headerViewData["bannerImage"] as! String
            headerData.category = headerViewData["category"] as! String
            headerData.subcategory = headerViewData["subcategory"] as! String
            self.setUpHeader()
        }
        
        if arrScrollData.count <= 0{
            arrScrollData  = [["imageName" : "brand1","title" : "Annual Multi Trip Policy", "numberOfAdults" : "1 adult", "price" : "£57.86","normalprice" : "normal: £75.00", "bannerImage": "yellow_banner"],["imageName" : "brand2","title" : "Europe Single Trip Policy", "numberOfAdults" : "7 days, 1 adult", "price" : "£34.00","normalprice" : "normal: £39.90", "bannerImage": "yellow_banner"]]
            
        }
        for dic in arrScrollData
        {
            let tableData = Price_Data()
            tableData.title = dic["title"] as! String
            tableData.imageName = dic["imageName"] as! String
            tableData.bannerImage = dic["bannerImage"] as! String
            tableData.numberOfDays = dic["numberOfDays"] as! String
            tableData.numberOfAdults = dic["numberOfAdults"] as! String
            tableData.price = dic["price"] as! String
            tableData.normalPrice = dic["normalPrice"] as! String
            
            arrPriceData.append(tableData)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK :- Configure HeaderView
    func setUpHeader(){
        let dic = headerData
       
        viewtblHeader.titleLabel.text = dic.title
        viewtblHeader.logoImageView.image = UIImage(named: dic.imageName)
        viewtblHeader.bannerImageView.image = UIImage(named: dic.bannerImage)
        
//        viewtblHeader.headerTitleLabel.text = dic.title
    }
    
    //MARK:- UIButton Action
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

//MARK: - Tableview Delegates And Datasource
extension brandPriceListVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //array count row
//        return arrtblData.count
        return arrPriceData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblbrandPriceCell") as! tblbrandPriceCellVC
        
//        let dic = arrtblData[indexPath.row]
         let dic = arrPriceData[indexPath.row]
      
        //set Cell Value
        cell.lblTitle.text = dic.title//dic["title"] as? String
        cell.lblNumberOfPerson.text = dic.numberOfAdults//dic["adult"] as? String
        cell.lblPrice.text = dic.price//dic["price"] as? String
        cell.lblNormalPrice.text = dic.normalPrice//dic["normalprice"] as? String
//        cell.imgLogo.image = UIImage(named:(dic["image"] as? String)!)

        cell.imgLogo.image = UIImage(named: dic.imageName)
        cell.imgBanner.image = UIImage(named: dic.bannerImage)
        
        return cell
    }
}


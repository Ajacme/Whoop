//
//  brandPriceListVC.swift
//  Whoop!
//
//  Created by Maulik Vinodbhai Vora on 18/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

//MARK: - UITableViewCell Class
class tblbrandPriceCellVC: UITableViewCell
{
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblNormalPrice: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    
}


class brandPriceListVC: UIViewController {
    @IBOutlet weak var tblDataList: UITableView!
    
    //tblHeader
    @IBOutlet var viewtblHeader: UIView!
    
    //alloc tablelist array
    var arrtblData = [[String : Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //add tableview header
        tblDataList.tableHeaderView = viewtblHeader
        
        //settblListData
        arrtblData  = [["image" : "brand1","title" : "Annual Multi Trip Policy", "adult" : "1 adult", "price" : "£57.86","normalprice" : "normal: £75.00"],["image" : "brand2","title" : "Europe Single Trip Policy", "adult" : "7 days, 1 adult", "price" : "£34.00","normalprice" : "normal: £39.90"]]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        return arrtblData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblbrandPriceCell") as! tblbrandPriceCellVC
        
        let dic = arrtblData[indexPath.row]
        
        //set Cell Value
        cell.lblTitle.text = dic["title"] as? String
        cell.lbl1.text = dic["adult"] as? String
        cell.lblPrice.text = dic["price"] as? String
        cell.lblNormalPrice.text = dic["normalprice"] as? String
        cell.imgLogo.image = UIImage(named:(dic["image"] as? String)!)
        
        return cell
    }
}


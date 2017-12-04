
//
//  WMHVC.swift
//  Whoop!
//
//  Created by Maulik Vinodbhai Vora on 18/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

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
    @IBOutlet var viewtblHeader: UIView!
    @IBOutlet weak var txttblHeader: UITextField!
    
    //alloc tablelist array
    var arrtblData = [[String : Any]]()
    
    var CellIdentifier = "WMHtblCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add tableview header
        tblDataList.tableHeaderView = viewtblHeader
        
        //settblListData
        arrtblData  = [["image" : "vodafone","image_bg" : "background","selected_image" :"","title" : "Vodafone","Desc":""],["image" : "goodtogo","image_bg" : "goodtogo_bg","selected_image" :"","title" : "Good to go","Desc":"Travel Insurance that is as unique as you are"],["image" : "coreforyoulogo","image_bg" : "coreforyou_bg","selected_image" :"","title" : "Cover for you","Desc":"Travel Insurance with cover for medical conditions and no age limit"]]
        
        let attributesDictionary = [NSAttributedStringKey.foregroundColor: UIColor (red: 255/255.0, green: 79/255.0, blue: 0/255.0, alpha: 0.4)]
        txttblHeader.attributedPlaceholder = NSAttributedString(string: "Search for your favourite brand",attributes:attributesDictionary)
        
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
        return arrtblData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WMHtblCell") as! WMHtblCellVC
        
        let dic = arrtblData[indexPath.row]
        
        //set Cell Value
        cell.lblTitle.text = dic["title"] as? String
        cell.lblDesc.text = dic["Desc"] as? String
        cell.imgLogo.image = UIImage(named:(dic["image"] as? String)!)
        cell.imgbgLogo.image = UIImage(named:(dic["image_bg"] as? String)!)
        cell.updateConstraintsIfNeeded()
        
        cell.btnOurWhoopMeHappy.tag = indexPath.row
        
        return cell
    }
}


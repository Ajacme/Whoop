//
//  SeeCodeVC.swift
//  Whoop!
//
//  Created by Dilip manek on 08/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

//MARK: - Set Static See Code Data
class SeeCode_Data: NSObject {
    class func getData() -> [SeeCode_ModleData] {
        
        var data = [SeeCode_ModleData]()
        data.append(SeeCode_ModleData.init(SeeCode: "476Wtfgj5", ExpireDays: "21Days",City: "", isSeeCodeUsedBefore: false))
        data.append(SeeCode_ModleData.init(SeeCode: "591TlvC3", ExpireDays: "15Days",City: "", isSeeCodeUsedBefore: false))
        data.append(SeeCode_ModleData.init(SeeCode: "999gJaX1", ExpireDays: "9Days",City: "", isSeeCodeUsedBefore: false))
        
        return data
    }
}

//MARK: - ModleClass SeeCode
class SeeCode_ModleData :  NSObject {
    
    //Variable
    var SeeCode : String = ""
    var ExpireDays : String = ""
    var City : String = ""
    var isSeeCodeUsedBefore: Bool = false
    
    override init() {
        
    }
    
    init(SeeCode: String, ExpireDays: String,City: String, isSeeCodeUsedBefore: Bool)
    {
        self.SeeCode = SeeCode
        self.City = City
        self.ExpireDays = ExpireDays
        self.isSeeCodeUsedBefore = isSeeCodeUsedBefore
    }
}

//MARK: - See Code Cell Protocol
protocol CellForSeeCodeCellDelegate: class {
    func didTappedOnControlUseCodeBtn(index: IndexPath, lblCode: String)
}


//MARK: - Cell For See Code
class CellForSeeCode: UITableViewCell {
    //Outlets
    @IBOutlet weak var lblExpireDays: MTLabel!
    @IBOutlet weak var lblCode: UILabel!
    @IBOutlet var lblUseCode: UILabel!
    @IBOutlet weak var imgTopBG: UIImageView!
    @IBOutlet weak var imgMiddleOrange: UIImageView!
    @IBOutlet var controlUseCode: UIControl!
    
    @IBOutlet var lblCity: UILabel!
    //Variable
    var delegateCell:CellForSeeCodeCellDelegate?
    var indexPath:IndexPath?
    
    //MARK: - Tapped Event
    @IBAction func tappedOnControlUseCode(_ sender: Any) {
        delegateCell?.didTappedOnControlUseCodeBtn(index: indexPath!, lblCode: lblCode.text!)
    }
    
}

//MARK: - See Code ViewController
class SeeCodeVC: UIViewController {

    //Outlets
    @IBOutlet var tableViewSeeCode: UITableView!
    

    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        tableViewSeeCode.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Click Events..
    @IBAction func tapToBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}


extension SeeCodeVC: UITableViewDelegate, UITableViewDataSource, CellForSeeCodeCellDelegate {
    
    //MARK: - CellForSeeCodeCellDelegate
    func didTappedOnControlUseCodeBtn(index: IndexPath, lblCode: String) {
        
        if self.navigationController != nil{

            for vc in (self.navigationController?.viewControllers)!{
                if vc is WebDealDetailVC{
                    let vcontroll  :WebDealDetailVC = vc as! WebDealDetailVC
                    vcontroll.getSelectedCode(selectedCode: lblCode)
                    selectedIndex = index.row
                    break
                }
            }
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSeeCodeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellForSeeCode") as! CellForSeeCode
        cell.delegateCell = self
        cell.indexPath = indexPath
        cell.lblCode.text = arrSeeCodeData[indexPath.row].SeeCode
        cell.lblExpireDays.text = arrSeeCodeData[indexPath.row].ExpireDays
        cell.lblCity.text = arrSeeCodeData[indexPath.row].City
        if arrSeeCodeData[indexPath.row].isSeeCodeUsedBefore == true {
            cell.imgTopBG.image = nil
            cell.imgTopBG.backgroundColor = UIColor(red: 141.0 / 255.0, green: 142.0 / 255.0, blue: 143.0 / 255.0, alpha: 1.0)
            cell.imgMiddleOrange.image = #imageLiteral(resourceName: "grey_happy")
            cell.lblUseCode.textColor = UIColor(red: 141.0 / 255.0, green: 142.0 / 255.0, blue: 143.0 / 255.0, alpha: 1.0)
            cell.controlUseCode.isUserInteractionEnabled = false
        } else if arrSeeCodeData[indexPath.row].isSeeCodeUsedBefore == false {
            cell.imgTopBG.image = #imageLiteral(resourceName: "bg")
            cell.controlUseCode.isUserInteractionEnabled = true

        }
        
        return cell
    }
    
    
}

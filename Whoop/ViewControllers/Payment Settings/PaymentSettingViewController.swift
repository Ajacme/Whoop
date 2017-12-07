//
//  PaymentSettingViewController.swift
//  Whoop
//
//  Created by ACMEUNIVERSE MAC-2 on 07/12/17.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit

class PaymentSettingViewController: UIViewController, UITableViewDataSource,UITableViewDelegate{

    @IBOutlet var tableViewPayment: UITableView!
    var paymentCellItems = [PaymentCell]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        paymentCellItems = [PaymentCell(title: "Card Number", placeHolder: "Add Number"),
                            PaymentCell(title: "Exp. Date", placeHolder: "Add exp. Date"),
                            PaymentCell(title: "Security Code", placeHolder: "Add CW"),
                            PaymentCell(title: "Full Name", placeHolder: "Enter full name"),
                            PaymentCell(title: "Email", placeHolder: "Enter email")]
        
        
        tableViewPayment.delegate = self
        tableViewPayment.estimatedRowHeight = 100
        tableViewPayment.rowHeight = UITableViewAutomaticDimension
        tableViewPayment.tableFooterView = UIView()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView DataSource & Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paymentCellItems.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            return tableView.dequeueReusableCell(withIdentifier: "CardPaymentScanCell")!
        }else{
            let cell:UITableViewCell  = tableView.dequeueReusableCell(withIdentifier: "CardPaymentCell", for: indexPath)
            let title = cell.viewWithTag(1) as? UILabel
            let textField = cell.viewWithTag(2) as? UITextField
            
            title?.text = paymentCellItems[indexPath.row-1].title
            textField?.placeholder = paymentCellItems[indexPath.row-1].placeHolder
            
            if indexPath.row == 3{
                cell.accessoryType = .detailButton
                cell.tintColor = UIColor.red
            }
            if indexPath.row == 4{
                textField?.text = "Huw Parry"
            }
            if  indexPath.row == 5{
                textField?.text = "connect2huw1@yahoo.com"
                cell.preservesSuperviewLayoutMargins = false
                cell.separatorInset = UIEdgeInsets.zero
                cell.layoutMargins = UIEdgeInsets.zero
            }
            return cell
        }
    }
    
    
    // MARK: - Click events..
    @IBAction func tapBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapNextButton(_ sender: Any) {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

class PaymentCell : NSObject{
    
    var title:String = ""
    var placeHolder:String = ""

    init(title: String, placeHolder: String)
    {
        self.title = title
        self.placeHolder = placeHolder
        
    }
    
    
}

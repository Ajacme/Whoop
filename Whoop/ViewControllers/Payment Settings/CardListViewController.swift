//
//  CardListViewController.swift
//  Whoop
//
//  Created by ACMEUNIVERSE MAC-2 on 07/12/17.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit

class CardListViewController: UIViewController, UITableViewDataSource,UITableViewDelegate{

    @IBOutlet var editButton: UIButton!
    @IBOutlet var tableViewCard: UITableView!
    var cardCellItems = [PaymentCell]()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        cardCellItems = [PaymentCell(title: "Card Number", placeHolder: "7652")
                            ]
        
        tableViewCard.delegate = self
        tableViewCard.estimatedRowHeight = 100
        tableViewCard.rowHeight = UITableViewAutomaticDimension
        tableViewCard.tableFooterView = UIView()
        
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - TableView DataSource & Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardCellItems.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell:UITableViewCell  = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath)
            let textField = cell.viewWithTag(1) as? UITextField
            textField?.text = cardCellItems[indexPath.row].placeHolder
            return cell
            
        }else{
           return tableView.dequeueReusableCell(withIdentifier: "AddCardCell", for: indexPath)
        }
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row  == cardCellItems.count{
            return false
        }
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//        }
    }

    // MARK: - Click events..
    @IBAction func tapBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }


    @IBAction func tapEditButton(_ sender: Any) {
        if editButton.titleLabel?.text == "Edit"{
            tableViewCard.setEditing(true, animated: true)
            editButton.setTitle("Done", for: .normal)
        }else{
            tableViewCard.setEditing(false, animated: true)
            editButton.setTitle("Edit", for: .normal)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

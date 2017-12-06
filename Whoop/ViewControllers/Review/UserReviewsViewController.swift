//
//  UserReviewsViewController.swift
//  Whoop
//
//  Created by ACMEUNIVERSE MAC-2 on 06/12/17.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit

class UserReviewsViewController: UIViewController, UITableViewDataSource,UITableViewDelegate{
    

    @IBOutlet var tableViewReview: UITableView!
    @IBOutlet var headerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewReview.delegate = self
        tableViewReview.tableHeaderView = headerView
        tableViewReview.estimatedRowHeight = 100
        tableViewReview.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 1{
            return tableView.dequeueReusableCell(withIdentifier: "CellReview2")!
        }else{
            return tableView.dequeueReusableCell(withIdentifier: "CellReview")!
        }
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapWriteReview(_ sender: Any) {
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

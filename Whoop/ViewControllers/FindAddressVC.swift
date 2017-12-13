//
//  FindAddressVC.swift
//  ZaeemTest
//
//  Created by Abdul Baseer on 07/11/2017.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit

class FindAddressVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.clear
    }
    
    @IBAction func tapChangeAddress(_ sender: Any) {
        
        let UnlockedDeal = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let initVC = UnlockedDeal.instantiateViewController(withIdentifier: "WhoopButtonViewController") as? WhoopButtonViewController{
            initVC.isRed = true
            initVC.isFromChangeAddress = true
            self.navigationController?.pushViewController(initVC, animated: true)
        }
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

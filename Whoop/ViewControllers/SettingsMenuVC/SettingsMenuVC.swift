//
//  SettingsMenuVC.swift
//  Whoop!
//
//  Created by Dilip Manek on 06/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

//MARK: - TableView Cell
class SettingsMenuTableViewCell: UITableViewCell {
    @IBOutlet var imgViewObj: UIImageView!
    @IBOutlet var lblSectionSubTitle: UILabel!
    @IBOutlet var constrainImgViewwidth: NSLayoutConstraint!
    @IBOutlet var constrainImageViewHeight: NSLayoutConstraint!
    @IBOutlet var constrainLblLeading: NSLayoutConstraint!
}

//MARK: - Setting View Controller
class SettingsMenuVC: UIViewController {

    //Outlets
    @IBOutlet var controlCloseBtn: UIControl!
    @IBOutlet var tableViewSettingMenu: UITableView!
    
    //Variables
    var isSectionSelected = -1
    var modelData = [ModelSectionDataSettingMenuSection]()

    // This is the size of our header sections that we will use later on.
    let SectionHeaderHeight: CGFloat = 50
    
    //MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewSettingMenu.tableFooterView = UIView()
        var arrManageYourButtonSubData = [ModelSubDataSettingMenu]()
        arrManageYourButtonSubData.append(ModelSubDataSettingMenu.init(strSectionTitle: "Your home's button".localized,
                                                                       imgSectionImage: #imageLiteral(resourceName: "home-btn")))
        arrManageYourButtonSubData.append(ModelSubDataSettingMenu.init(strSectionTitle: "Your personal button".localized,
                                                                       imgSectionImage: #imageLiteral(resourceName: "personal-btn")))
        
        modelData.append(ModelSectionDataSettingMenuSection.init(strSectionTitle: "Manage your button".localized,
                                                                 imgSectionImage: #imageLiteral(resourceName: "manage"),
                                                                 imgDropDown: #imageLiteral(resourceName: "DropDownRight"),
                                                                 imgDropDownBottom: #imageLiteral(resourceName: "DropDownBottom"),
                                                                 isSectionselected: false,
                                                                 subMenuData: arrManageYourButtonSubData))
        modelData.append(ModelSectionDataSettingMenuSection.init(strSectionTitle: "Deals to unlock".localized,
                                                                 imgSectionImage: #imageLiteral(resourceName: "deals-to-unlock"),
                                                                 imgDropDown: #imageLiteral(resourceName: "DropDownRight"),
                                                                 imgDropDownBottom: #imageLiteral(resourceName: "DropDownBottom"),
                                                                 isSectionselected: false))
        modelData.append(ModelSectionDataSettingMenuSection.init(strSectionTitle: "Unlocked Deals".localized,
                                                                 imgSectionImage: #imageLiteral(resourceName: "unlocked-deal"),
                                                                 imgDropDown: #imageLiteral(resourceName: "DropDownRight"),
                                                                 imgDropDownBottom: #imageLiteral(resourceName: "DropDownBottom"),
                                                                 isSectionselected: false))
        modelData.append(ModelSectionDataSettingMenuSection.init(strSectionTitle: "Super Whoop! Deal".localized,
                                                                 imgSectionImage: #imageLiteral(resourceName: "super"),
                                                                 imgDropDown: #imageLiteral(resourceName: "DropDownRight"),
                                                                 imgDropDownBottom: #imageLiteral(resourceName: "DropDownBottom"),
                                                                 isSectionselected: false))
        modelData.append(ModelSectionDataSettingMenuSection.init(strSectionTitle: "Whoop! Me Happy Codes".localized,
                                                                 imgSectionImage: #imageLiteral(resourceName: "happy-codes"),
                                                                 imgDropDown: #imageLiteral(resourceName: "DropDownRight"),
                                                                 imgDropDownBottom: #imageLiteral(resourceName: "DropDownBottom"),
                                                                 isSectionselected: false))
        modelData.append(ModelSectionDataSettingMenuSection.init(strSectionTitle: "Profile".localized,
                                                                 imgSectionImage: #imageLiteral(resourceName: "profile"),
                                                                 imgDropDown: #imageLiteral(resourceName: "DropDownRight"),
                                                                 imgDropDownBottom: #imageLiteral(resourceName: "DropDownBottom"),
                                                                 isSectionselected: false))
        modelData.append(ModelSectionDataSettingMenuSection.init(strSectionTitle: "Wallet".localized,
                                                                 imgSectionImage: #imageLiteral(resourceName: "wallet"),
                                                                 imgDropDown: #imageLiteral(resourceName: "DropDownRight"),
                                                                 imgDropDownBottom: #imageLiteral(resourceName: "DropDownBottom"),
                                                                 isSectionselected: false))

}
    
    @IBAction func tapSettingsClose(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        tableViewSettingMenu.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isSectionSelected == 5 {
            isSectionSelected = -1
            tableViewSettingMenu.reloadData()
        }
    }
}

extension SettingsMenuVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if (tableViewSettingMenu == tableView) {
            return modelData.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if isSectionSelected == section {
           return modelData[section].subMenuData.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return SectionHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //Add Section View
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: SectionHeaderHeight))
        view.backgroundColor = UIColor.white

        let imgViewObj = UIImageView(frame: CGRect(x: 17, y: 16.5, width: 15, height: 15))
        imgViewObj.image = modelData[section].imgSectionImage
        imgViewObj.contentMode = .scaleAspectFit
        view.addSubview(imgViewObj)
        
        let imgViewDropDownObj = UIImageView(frame: CGRect(x: tableView.bounds.width - 34, y: 16.5, width: 15, height: 15))
        imgViewDropDownObj.contentMode = .scaleAspectFit
        imgViewDropDownObj.tag = section + 1000
        view.addSubview(imgViewDropDownObj)
        
        if isSectionSelected == section {
            imgViewDropDownObj.image = modelData[section].imgDropDownBottom
            view.backgroundColor = UIColor(red: 163.00/255.00, green: 161.00/255.00, blue: 166.00/255.00, alpha: 1)

        }else {
            imgViewDropDownObj.image = modelData[section].imgDropDown
            view.backgroundColor = UIColor.white
        }
        
        //Add Section Title Label
        let label = UILabel(frame: CGRect(x: 44, y: 0, width: tableView.bounds.width - 30, height: SectionHeaderHeight))
        label.font = UIFont(name: "Lato-Semibold", size: 14)
        label.textColor = UIColor.black
        label.text = modelData[section].strSectionTitle
        view.addSubview(label)

        //Add Edit ControlView Button
        let editViewControl = UIButton(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: SectionHeaderHeight))
        editViewControl.addTarget(self, action: #selector(tappedToSections), for: .touchUpInside)
        editViewControl.backgroundColor = UIColor.clear
        editViewControl.tag = section
        view.addSubview(editViewControl)

        
        //Add bottom line
        let bottomView = UIView(frame: CGRect(x: 16, y: SectionHeaderHeight - 1, width: editViewControl.frame.width - 33, height: 0.5))
        bottomView.backgroundColor = UIColor(red: 222.00/255.00, green: 222.00/255.00, blue: 222.00/255.00, alpha: 1)
        view.addSubview(bottomView)
        
        return view
    }


    @objc func tappedToSections(sender: UIButton) {
        print(sender.tag)
//        tableViewSettingMenu.reloadData()
        let lastSelected = isSectionSelected
        let emojiView  = self.view.viewWithTag(sender.tag + 1000) as! UIImageView
        
        if isSectionSelected == sender.tag {
            isSectionSelected = -1
            
        } else {
            isSectionSelected = sender.tag
            emojiView.image = UIImage(named: "DropDownBottom")
        }
        
        if sender.tag == 5 {
            let Profile = UIStoryboard(name: "Profile", bundle: Bundle.main)
            let initVC = Profile.instantiateViewController(withIdentifier: "EmailPasswordVC") as! EmailPasswordVC
            self.navigationController?.pushViewController(initVC, animated: true)
        }

        if sender.tag == 6 {
            let Profile = UIStoryboard(name: "Main", bundle: Bundle.main)
            let initVC = Profile.instantiateViewController(withIdentifier: "CardListViewController") as! CardListViewController
            self.navigationController?.pushViewController(initVC, animated: true)
        }
        
        //Open Section with animation
        if sender.tag == 0 {
        self.tableViewSettingMenu.reloadSections(NSIndexSet(index: sender.tag) as IndexSet, with: UITableViewRowAnimation.automatic)
            if lastSelected != -1 {
                self.tableViewSettingMenu.reloadSections(NSIndexSet(index: lastSelected) as IndexSet, with: UITableViewRowAnimation.automatic)
            }

        } else {
            tableViewSettingMenu.reloadData()
        }
        if sender.tag == 1 {
            
            if let initVC = self.storyboard?.instantiateViewController(withIdentifier: "SettingUnlockDealViewController") as? SettingUnlockDealViewController{
                initVC.isDealToUnlock = true
                self.navigationController?.pushViewController(initVC, animated: true)
            }
            
        }
        
        if sender.tag == 2 {
            if let initVC = self.storyboard?.instantiateViewController(withIdentifier: "SettingUnlockDealViewController") as? SettingUnlockDealViewController{
                initVC.isDealToUnlock = false
                self.navigationController?.pushViewController(initVC, animated: true)
            }
           
        }
        
        if sender.tag == 3 {
            if let initVC = self.storyboard?.instantiateViewController(withIdentifier: "SuperWhoopDetailVC") as? SuperWhoopDetailVC{
                self.navigationController?.pushViewController(initVC, animated: true)
            }
        }
        
        if sender.tag == 4 {
            let UnlockedDeal = UIStoryboard(name: "UnlockedDeal", bundle: Bundle.main)
            if let initVC = UnlockedDeal.instantiateViewController(withIdentifier: "SeeCodeVC") as? SeeCodeVC{
                self.navigationController?.pushViewController(initVC, animated: true)
            }
            
        }
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsMenuTableViewCell") as! SettingsMenuTableViewCell
        
        cell.imgViewObj.image = modelData[indexPath.section].subMenuData[indexPath.row].imgSectionImage
        cell.lblSectionSubTitle.text =  modelData[indexPath.section].subMenuData[indexPath.row].strSectionTitle

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        
        if indexPath.section == 0 && indexPath.row == 0  {
            let ButtonManagementInSetting = UIStoryboard(name: "ButtonManagementInSetting", bundle: Bundle.main)
            let initVC = ButtonManagementInSetting.instantiateViewController(withIdentifier: "HomeButtonVC") as! HomeButtonVC
            self.navigationController?.pushViewController(initVC, animated: true)
            
        } else if indexPath.section == 0 && indexPath.row == 1  {
            
            let ButtonManagementInSetting = UIStoryboard(name: "ButtonManagementInSetting", bundle: Bundle.main)
            let initVC = ButtonManagementInSetting.instantiateViewController(withIdentifier: "PersonalButtonVC") as! PersonalButtonVC
            self.navigationController?.pushViewController(initVC, animated: true)
        } else if indexPath.section == 1 && indexPath.row == 0  {
            
            
        }
    }
}

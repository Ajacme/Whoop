//
//  WebDealDetailVC.swift
//  Whoop!
//
//  Created by Dilip manek on 03/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

/*class Insurance_data :  NSObject {
    
    var title : String = ""
    var desc : String = ""
    var imageName : String = ""
    var selectedBGImage : String = ""
    var isGetQuotes : Bool = false
    var displayMessage : String = ""
    var isLocked : Bool = false
    var UnlockedimageName : String = ""
    
    override init() {
        
    }
    
    init(title: String, desc: String, imageName: String, isGetQuotes: Bool,selectedBGImage : String,displayMessage : String)
    {
        self.title = title
        self.desc = desc
        self.imageName = imageName
        self.isGetQuotes = isGetQuotes
        self.selectedBGImage = selectedBGImage
        self.displayMessage = displayMessage
    }
}*/
class CellForBoostTickets: UITableViewCell {
    
    @IBOutlet weak var cntrolTapImage: UIControl!
    @IBOutlet weak var btnTopIcon: UIButton!
    @IBOutlet weak var lblMainTitle: UILabel!
    @IBOutlet weak var lblUsesCredit: UILabel!
    @IBOutlet weak var lblUnlockBy: UILabel!
    @IBOutlet weak var lblDealBoosted: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblGetQuotes: UILabel!
    @IBOutlet weak var viewForBack: UIView!
   // @IBOutlet weak var viewForShadow: UIView!

    @IBOutlet weak var imgTopBG: UIImageView!
    @IBOutlet weak var imgMiddleblue: UIImageView!
}
class BoostDealDetailVC: UIViewController,CustomToolBarDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var tableViewMain: UITableView!
    @IBOutlet weak var viewForHeader: UIView!
    var arrScrollData = [[String : Any]]()
    var  arrInsuranceData = [Insurance_data]()
    var pulseEffect:PulsingHaloLayer!
    var objCodePopUp = ViewForPopUp()
    var toolBar : CustomToolBar = CustomToolBar.init(frame: CGRect(x: 0, y: 0, width: ScreenSize.WIDTH, height: 40),isSegment: false)
    var cellTapTag = -1
   // var strSelectedCode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewMain.estimatedRowHeight = 401
        viewForHeader.frame = CGRect(x: 0, y: 0, width: ScreenSize.WIDTH, height: 190)
        tableViewMain.tableHeaderView = viewForHeader
        arrScrollData  = [["image" : "blue_plane","selected_bg" :"","title" : "Travel Insurance".localized,"Desc":"You'll only use this credit/deal if you buy a policy".localized , "message" : "Uses 1 credit".localized],["image" : "blue_travel_medical","selected_bg" :"","title" : "Travel Insurance with Medical".localized,"Desc":"You'll only use this credit/deal if you buy a policy".localized , "message" : "Uses 1 credit".localized],["image" : "blue_car_break","selected_bg" :"","title" : "Car breakdown".localized,"Desc":"You'll only use this credit/deal if you buy a policy".localized , "message" : "Uses 1 credit".localized]]
        
        for dic in arrScrollData
        {
            let tableData = Insurance_data()
            tableData.title = dic["title"] as! String
            tableData.imageName = dic["image"] as! String
            tableData.displayMessage = dic["message"] as! String
            tableData.desc = dic["Desc"] as! String
            tableData.isGetQuotes = false
            tableData.selectedBGImage = dic["selected_bg"] as! String
            arrInsuranceData.append(tableData)
        }
        self.tabBarController?.tabBar.isHidden = true
    }
    //MARK: - Get Selected Code....
    func getSelectedCode(selectedCode : String?) {
        if selectedCode != nil && selectedCode != ""
        {
           objCodePopUp.txtEnterCode.text = selectedCode
        }
    }
    
    //MARK: - Shadow Method....
    func add_shadow(demoView : UIView,height : CGFloat){
        
        let radius: CGFloat = demoView.frame.width //change it to .height if you need spread for height
        let shadowPath = UIBezierPath(rect: CGRect(x: -1, y: 0, width: radius + 0.5 , height:height - 4.0))
        //Change 2.1 to amount of spread you need and for height replace the code for height
        
        demoView.layer.cornerRadius = height/2
        demoView.layer.shadowColor = UIColor.darkGray.cgColor
        demoView.layer.shadowOffset = CGSize(width: 0.1, height: 0.2)  //Here you control x and y
        demoView.layer.shadowOpacity = 1
        demoView.layer.shadowRadius = 20 //Here your control your blur
        demoView.layer.masksToBounds =  false
        demoView.layer.shadowPath = shadowPath.cgPath
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Click Events....
    @IBAction func tapToMiddleImage(_ sender: UIControl) {
        
    }
    @IBAction func tapToBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func tapToOpenPopUp(_ sender: UIButton) {
        cellTapTag = sender.tag
        self.customCodeView()
    }
    @IBAction func tapToClosePopUp(_ sender: UIButton) {
        self.objCodePopUp.removeFromSuperview()
        self.objCodePopUp.Cons_ViewMiddle.constant = 1000
    }
    @IBAction func tapToSeeYouCode(_ sender: UIButton) {
        let objSeeCodeVC = self.storyboard?.instantiateViewController(withIdentifier: "SeeCodeVC") as! SeeCodeVC
        self.navigationController?.pushViewController(objSeeCodeVC, animated: true)
    }
    @IBAction func tapToUseCode(_ sender: UIControl) {
        
        let text =  objCodePopUp.txtEnterCode.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if (text?.characters.count)! > 0
        {
            self.view.endEditing(true)
            self.objCodePopUp.removeFromSuperview()
            self.objCodePopUp.Cons_ViewMiddle.constant = 1000
            self.rippleEffectMethod(buttonTag: cellTapTag)
            arrSeeCodeData[selectedIndex].isSeeCodeUsedBefore = true

        }else
        {
            showAlert(title: "Alert", message: "Please enter code!")
        }
    }
    // MARK: - CustumeView Design For PopUp
    func customCodeView()  {
        objCodePopUp = Bundle.main.loadNibNamed("ViewForPopUp", owner: self, options: nil)?.first as! ViewForPopUp
        self.objCodePopUp.frame = CGRect(x: 0, y:89, width:ScreenSize.WIDTH, height:ScreenSize.HEIGHT - 89)
        objCodePopUp.backgroundColor = UIColor.clear
        self.view.addSubview(objCodePopUp)
        UIView.animate(withDuration: 0.5) {
            //self.objCodePopUp.alpha = 0.5
            self.objCodePopUp.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
            self.objCodePopUp.Cons_ViewMiddle.constant = 0
            self.view.layoutIfNeeded()
        }
        objCodePopUp.txtEnterCode.autocorrectionType = .no
        objCodePopUp.txtEnterCode.inputAccessoryView = toolbarInit(textField: objCodePopUp.txtEnterCode)
        objCodePopUp.txtEnterCode.delegate = self
        //Buttons Click Events..
        self.objCodePopUp.btnClose.addTarget(self, action: #selector(self.tapToClosePopUp(_:)), for: .touchUpInside)
        self.objCodePopUp.btnSeeYourCode.addTarget(self, action: #selector(self.tapToSeeYouCode(_:)), for: .touchUpInside)
        self.objCodePopUp.controlUseCode.addTarget(self, action: #selector(self.tapToUseCode(_:)), for: .touchUpInside)
    }
    
    // MARK: - Toolbar Keyboard
    
    func toolbarInit(textField: UITextField) -> UIToolbar
    {
        toolBar.delegate1 = self
        toolBar.txtField = textField
        return toolBar;
    }
    // MARK: - Custom ToolBar Delegates
    func closeKeyBoard() {
        self.view.endEditing(true)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        objCodePopUp.Cons_ViewTop.isActive = true
        objCodePopUp.Cons_ViewTop.constant = 25
        objCodePopUp.Cons_ViewMiddle.isActive = false
        objCodePopUp.layoutIfNeeded()
        return true;
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        objCodePopUp.Cons_ViewTop.isActive = false
        objCodePopUp.Cons_ViewMiddle.constant = 0
        objCodePopUp.Cons_ViewMiddle.isActive = true
        //textField.text?.localized
        return true;
    }
    func rippleEffectMethod(buttonTag : Int) {
        
        let dic = arrInsuranceData[buttonTag]
        let indexPath = IndexPath(row: buttonTag, section: 0)
        
        if !dic.isGetQuotes{
            
            let cell = tableViewMain.cellForRow(at: indexPath) as! CellForBoostTickets
            if self.pulseEffect != nil {
                self.pulseEffect.removeFromSuperlayer()
            }
            self.pulseEffect = PulsingHaloLayer()
            self.pulseEffect.haloLayerNumber = 7
            self.pulseEffect.animationDuration = 3
            // self.pulseEffect.beginTime = 0.0
            self.pulseEffect.radius = 125.0
            self.pulseEffect.backgroundColor = UIColor.init(red: 75/255.0, green: 166/255.0, blue: 249/255.0, alpha: 1.0).cgColor
            self.pulseEffect.position = cell.cntrolTapImage.center
            cell.viewForBack.layer.addSublayer(self.pulseEffect)
            self.pulseEffect.start()
            cell.imgTopBG.backgroundColor = UIColor(red: 141.0 / 255.0, green: 142.0 / 255.0, blue: 143.0 / 255.0, alpha: 1.0)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                UIView.animate(withDuration: 1.5, animations: {
                    dic.isGetQuotes = true
                    dic.displayMessage = "Expires in 45 days".localized
                    self.setCellcolorAndImage(cell: cell, dic: dic)
                    self.pulseEffect.backgroundColor = UIColor.init(red: 75/255.0, green: 166/255.0, blue: 249/255.0, alpha: 0.0).cgColor
                }, completion: { (result) in
                    self.cellTapTag = -1
                    self.pulseEffect.removeFromSuperlayer()
                })
            }
        }
    }
}
//MARK: - Tableview Delegates And Datasource

extension BoostDealDetailVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrInsuranceData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellForBoostTickets") as! CellForBoostTickets
        let dic = arrInsuranceData[indexPath.row]
        cell.lblMainTitle.text = dic.title
        cell.lblDesc.text = dic.desc
        cell.btnTopIcon.tag = indexPath.row
        cell.lblUsesCredit.text = dic.displayMessage
        if dic.isGetQuotes
        {
            self.setCellcolorAndImage(cell: cell, dic: dic)
        }else{
            cell.imgMiddleblue.image = UIImage(named: dic.imageName)
            cell.lblGetQuotes.text = "GET A QUOTE".localized
            cell.imgTopBG.image = UIImage(named:"bg")
            cell.btnTopIcon.isHidden = false
            cell.lblDealBoosted.text = ""
        }
        return cell
    }
   
    func setCellcolorAndImage(cell : CellForBoostTickets ,dic : Insurance_data) {
        cell.btnTopIcon.isHidden = true
        UIView.transition(with: cell.lblUsesCredit,
                          duration: 0.25,
                          options: .transitionCrossDissolve,
                          animations: { [weak self] in
                            cell.lblUsesCredit.text = dic.displayMessage
            }, completion: nil)
        cell.lblDealBoosted.text = "Deal Boosted".localized
        cell.lblGetQuotes.text = "Get a Quote".localized
        cell.imgTopBG.image = UIImage(named:"orange_bg")
    }
}

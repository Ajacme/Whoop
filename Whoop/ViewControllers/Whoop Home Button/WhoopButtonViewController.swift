//
//  WhoopButtonViewController.swift
//  Whoop
//
//  Created by ZaeemZafar on 11/8/17.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit
import JHChainableAnimations

class WhoopButtonViewController: UIViewController,UIScrollViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var dealsStackView: UIStackView!
    @IBOutlet weak var whoopButtonImageView: UIImageView!
 
    @IBOutlet var yourHomeLabel: UILabel!
    @IBOutlet var secondLineLabel: UILabel!
    @IBOutlet weak var buttonsStackView: UIStackView!
    @IBOutlet var notificationView: UIView!
    
    @IBOutlet var lockedUnlockedLabel: UILabel!
    @IBOutlet var circleViews: [UIView]!

    @IBOutlet var inviteIconText: UILabel!
    @IBOutlet var lockIconText: UILabel!
    
    @IBOutlet var addPhotoButton: UIButton!
    @IBOutlet var boostDealLbl: UILabel!
    @IBOutlet var unlockedDealLbl: UILabel!
    @IBOutlet var secondLabelHeight: NSLayoutConstraint!
    @IBOutlet var dealLeftToUnlocklbl: UILabel!
    @IBOutlet var addPhotoButtonText: UIButton!
    
    
    @IBOutlet weak var whoopMeHappyButton: UIButton!
    @IBOutlet var buttonRGY: UIButton!
    @IBOutlet var inviteLabel: UILabel!
    @IBOutlet var inviteIcon: UIButton!
    @IBOutlet var lockedButtonIcon: UIButton!
    @IBOutlet var whiteTickIcon: UIButton!
    var objCodePopUp = ViewForCodePopUp()
    var config = CoreConfig.sharedInstance
    private var cameraController = UIImagePickerController()
    
    var isRed = false
    var isGreen = false
    var isYellow = false
    
    var isTakeImage = Bool()
    
    var pulseEffect : PulsingHaloLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
     
    }
    func setUpView(){
        whoopButtonImageView.alpha = 0
        dealsStackView.alpha = 0
        buttonsStackView.alpha = 0
        addPhotoButton.alpha = 0
        addPhotoButtonText.alpha = 0
        addPhotoButton.layer.borderWidth = 1
        addPhotoButton.layer.borderColor = UIColor.lightGray.cgColor
        
        buttonRGY.isUserInteractionEnabled = false
      
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        
         let attributedString    = NSMutableAttributedString(string: "16, Westway, London, SW1 1AW")
         let range               = ("16, Westway, London, SW1 1AW" as NSString).range(of: "16, Westway, London, SW1 1AW")
        
        attributedString.addAttribute(NSAttributedStringKey.underlineStyle, value: NSNumber(value: 1), range: range)
        
        
        attributedString.addAttributes([NSAttributedStringKey.paragraphStyle: paragraph], range: range)
        
        var labelText = ""
        attributedString.addAttribute(NSAttributedStringKey.underlineColor, value: UIColor.white, range: range)
        
        if isRed{
            
            lockIconText.text = "Your home's button is locked"
            inviteIconText.text = "Invite the people you live with"
            
            inviteIcon.setImage(#imageLiteral(resourceName: "invite_grey"), for: .normal)
            inviteIcon.tintColor = UIColor.groupTableViewBackground
            whiteTickIcon.tintColor =  UIColor.groupTableViewBackground
            whiteTickIcon.setImage(#imageLiteral(resourceName: "tick-white"), for: .normal)
            notificationView.backgroundColor = UIColor.colorWithHexString(hex: "F52404")
            lockedUnlockedLabel.text = "Locked"
            
            labelText = "Verify address to unlock your button"
            
            attributedString.addAttribute(NSAttributedStringKey.underlineColor, value: UIColor.white, range: range)
            yourHomeLabel.text = labelText
            secondLineLabel.attributedText = attributedString
            
            secondLineLabel.textColor = UIColor.white
            yourHomeLabel.textColor = UIColor.white

            boostDealLbl.text = "0"
            unlockedDealLbl.text = "0"
            dealLeftToUnlocklbl.text = "3"
        }
        if isGreen{
            
            inviteIconText.text = "Invite the people you live with"
            
            inviteIcon.tintColor = UIColor.colorWithHexString(hex: "FE8B3A")
            addPhotoButton.isHidden = false
            addPhotoButtonText.isHidden = false
            whiteTickIcon.setImage(#imageLiteral(resourceName: "tick"), for: .normal)
            whiteTickIcon.tintColor =  UIColor.colorWithHexString(hex: "FE8B3A")
            
            notificationView.backgroundColor = UIColor.colorWithHexString(hex: "61B64F")
            lockedUnlockedLabel.text = "Unlocked"
            
            yourHomeLabel.textColor = UIColor.white
            secondLineLabel.textColor = UIColor.white
            labelText = "Your home's Whoop! Button is unlocked at"
            attributedString.addAttribute(NSAttributedStringKey.underlineColor, value: UIColor.white, range: range)
            yourHomeLabel.text = labelText
            secondLineLabel.attributedText = attributedString
            
           
        }
        if isYellow{
            
            lockIconText.text = "Your home's button is locked"
            inviteIconText.text = "Invite the people you live with"
            
            inviteIcon.setImage(#imageLiteral(resourceName: "invite_grey"), for: .normal)
            inviteIcon.tintColor = UIColor.groupTableViewBackground
            whiteTickIcon.setImage(#imageLiteral(resourceName: "tick-white"), for: .normal)
            whiteTickIcon.tintColor =  UIColor.groupTableViewBackground
//            inviteLabel.text = "Day Left"
            boostDealLbl.text = "0"
            unlockedDealLbl.text = "0"
            dealLeftToUnlocklbl.text = "3"
            
            lockedUnlockedLabel.text = "Locked"
            notificationView.backgroundColor = UIColor.colorWithHexString(hex: "FBEB32")
            secondLabelHeight.constant = -5
            yourHomeLabel.textColor = UIColor.red
            labelText = "You've requested a unique code to unlock your home's button at 16, Westway, London, SW1 1AW"
            let attributedStringYellow    = NSMutableAttributedString(string: labelText)
            let rangeYellow               = (labelText as NSString).range(of: "16, Westway, London, SW1 1AW")

            attributedStringYellow.addAttribute(NSAttributedStringKey.underlineStyle, value: NSNumber(value: 1), range: rangeYellow)
            attributedStringYellow.addAttribute(NSAttributedStringKey.underlineColor, value: UIColor.red, range: rangeYellow)
            attributedStringYellow.addAttributes([NSAttributedStringKey.paragraphStyle: paragraph], range: rangeYellow)

            yourHomeLabel.attributedText = attributedStringYellow
        }
        
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        guard let imageAdd =  config.isTakeImage() else {
            addPhotoButton.setImage(#imageLiteral(resourceName: "add_photo"), for: .normal)
            addPhotoButtonText.titleLabel?.text = "Add Photo"
            return
        }
        let imageFromData = UIImage(data: imageAdd)
        addPhotoButton.setImage(imageFromData, for: .normal)
        addPhotoButtonText.setTitle("Change Photo", for: .normal)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        for circleView in circleViews {
            circleView.layer.cornerRadius = circleView.frame.width/2
        }
        if CoreConfig.sharedInstance.isFirstEnter() == false{
            animateTheSwipeUp()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                self.customChatView(invite: false)
            })
            
            UserDefaults.standard.set(true, forKey: "isFirstEnter")
        }
       
        
    }
    func animateTheSwipeUp(){
        let animator1 = JHChainableAnimator(view: whoopButtonImageView)
        animator1?.moveY()(300)?.thenAfter()(0.01)?.moveY()(-300)?.makeOpacity()(1)?.animate()(0.37)
        
        let animator2 = JHChainableAnimator(view: dealsStackView)
        animator2?.moveY()(200)?.thenAfter()(0.1)?.moveY()(-200)?.makeOpacity()(1)?.animate()(0.37)
        
        let animator3 = JHChainableAnimator(view: addPhotoButton)
        animator3?.moveY()(200)?.thenAfter()(0.15)?.moveY()(-200)?.makeOpacity()(1)?.animate()(0.37)
        
        let animator5 = JHChainableAnimator(view: addPhotoButtonText)
        animator5?.moveY()(200)?.thenAfter()(0.15)?.moveY()(-200)?.makeOpacity()(1)?.animate()(0.37)
        
        let animator4 = JHChainableAnimator(view: buttonsStackView)
        animator4?.moveY()(200)?.thenAfter()(0.2)?.moveY()(-200)?.makeOpacity()(1)?.animate()(0.37)
    }
    
    // MARK: - Click events..
    @IBAction func tapRedNotificationBar(_ sender: Any) {
        customChatView(invite: false)
    }
    
    @IBAction func tapInviteIcon(_ sender: Any) {
        if isRed || isYellow {
            customChatView(invite: true)
        }else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let objHomeVC = storyboard.instantiateViewController(withIdentifier: "InviteViewController") as?   InviteViewController{
                self.navigationController?.pushViewController(objHomeVC, animated: true)
            }
            
        }
    }
    @IBAction func tapAddPhotoButton(_ sender: Any) {
      
        if let title = addPhotoButtonText.titleLabel?.text, title == "Add Photo"{
            getPhotoLibrary()
        }else{
            let storyboard = UIStoryboard(name: "ButtonManagementInSetting", bundle: nil)
            if let objHomeVC = storyboard.instantiateViewController(withIdentifier: "HomeButtonVC") as?   HomeButtonVC{
                self.navigationController?.pushViewController(objHomeVC, animated: true)
            }
        }
        
       
        
    }
    
    @IBAction func tapToPopupClose(_ sender: UIButton) {
        buttonRGY.isUserInteractionEnabled = true
        self.objCodePopUp.removeFromSuperview()
        self.objCodePopUp.Cons_ViewTop.constant = 1000
    }
    
    @IBAction func tapUnlockButton(_ sender: Any) {
        
            if lockedUnlockedLabel.text == "Locked"{
                if let objHomeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeWhoopOnBoardingVC") as?   HomeWhoopOnBoardingVC{
                    self.navigationController?.pushViewController(objHomeVC, animated: true)
                }
            }
       
    }
    @IBAction func settingsButtonTapped(_ sender: Any) {
        
    }

    @IBAction func tapToWhoopMeHappy(_ sender: Any) {
        
        if self.pulseEffect != nil {
            self.pulseEffect.removeFromSuperlayer()
        }
        
        self.pulseEffect = PulsingHaloLayer()
        self.pulseEffect.haloLayerNumber = 7
        self.pulseEffect.animationDuration = 3
        self.pulseEffect.radius = 125.0
        self.pulseEffect.backgroundColor = UIColor.init(red: 255/255.0, green: 79/255.0, blue: 0/255.0, alpha: 1.0).cgColor
        
        
        let verticalCenter: CGFloat = self.whoopMeHappyButton.bounds.size.height / 2.0
        let horizontalCenter: CGFloat = self.whoopMeHappyButton.bounds.size.width / 2.0
        let buttoncenter = CGPoint(x: horizontalCenter, y: verticalCenter)
        self.pulseEffect.position = buttoncenter//cell.imgMiddleblue.center
        self.whoopButtonImageView.layer.addSublayer(self.pulseEffect)
        
        self.pulseEffect.start()

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
            let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let controller = storyboard.instantiateViewController(withIdentifier: "NewMessageCentreViewController") as! NewMessageCentreViewController
            self.navigationController?.pushViewController(controller, animated: true)
            self.pulseEffect.removeFromSuperlayer()
        })
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - CustumeView Design For PopUp
    func customChatView(invite:Bool)  {
        buttonRGY.isUserInteractionEnabled = false
        objCodePopUp = Bundle.main.loadNibNamed("ViewForCodePopUp", owner: self, options: nil)?.first as! ViewForCodePopUp
        self.objCodePopUp.frame = CGRect(x: 0, y:0, width:ScreenSize.WIDTH, height:ScreenSize.HEIGHT)
        
        objCodePopUp.lblTitle.textAlignment = NSTextAlignment.center
        if invite{
            objCodePopUp.lblTitle.text = "Invite"
            objCodePopUp.lblDesc.text = "You can only invite the people you live with once you've verified your address"
        }else{
            if isGreen {
                objCodePopUp.lblTitle.text = "Unlocked!"
                objCodePopUp.lblDesc.text = "Your home's button is now unlocked. You can now access all of your home’s deals and invite the people you live with.\nRemember to add a photo to your button so the people you live with know it's you. Tap a profile to start."
            }else{
                
                if isYellow{
                    objCodePopUp.lblTitle.text = "Unique code"
                    objCodePopUp.lblDesc.text = "You've just requested a unique code to verify your address. It will arrive in 2 or 3 days. In the meantime you can use the deals we've added to your button."
                }else{
                    objCodePopUp.lblTitle.text = "Your home's Whoop! Button."
                    objCodePopUp.lblDesc.text = "Verify your address to finishing unlocking your home's button and access all of your deals. If you've received an invite code enter it to join. For a quick start we’ve added 3 deals now to use straight away."
                }
            }
        }
        
        
        objCodePopUp.backgroundColor = UIColor.clear
        self.view.addSubview(objCodePopUp)
        UIView.animate(withDuration: 0.5) {
            //self.objCodePopUp.alpha = 0.5
            self.objCodePopUp.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
            self.objCodePopUp.Cons_ViewTop.constant = 40
            self.view.layoutIfNeeded()
        }
        self.objCodePopUp.btnClose.addTarget(self, action: #selector(self.tapToPopupClose(_:)), for: .touchUpInside)
        self.objCodePopUp.btnCancel.addTarget(self, action: #selector(self.tapToPopupClose(_:)), for: .touchUpInside)
    }
    
    // Photo Alertaction
    func getPhotoLibrary(){
        let actionSheetController: UIAlertController = UIAlertController(title:nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
        }
        actionSheetController.addAction(cancelAction)
        
        let choosePictureAction: UIAlertAction = UIAlertAction(title: "Photo Library", style: .default) { action -> Void in
            
            _ = self.startCameraFromViewController(self, sourceType:.photoLibrary, withDelegate:self as UIImagePickerControllerDelegate & UINavigationControllerDelegate)
        }
        actionSheetController.addAction(choosePictureAction)
        
        self.present(actionSheetController, animated: true, completion: nil)
        
        let takePictureAction: UIAlertAction = UIAlertAction(title: "Choose From Camera", style: .default) { action -> Void in
            
            _ = self.startCameraFromViewController(self, sourceType: .camera, withDelegate: self as UIImagePickerControllerDelegate & UINavigationControllerDelegate )
        }
        actionSheetController.addAction(takePictureAction)
    }
    
    
    
    //MARK: - ImagePicker Delegate Action
    
    func startCameraFromViewController(_ viewController: UIViewController,sourceType:UIImagePickerControllerSourceType, withDelegate delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate) -> Bool {
        
        if UIImagePickerController.isSourceTypeAvailable(sourceType) == false {
            return false
        }
        cameraController = UIImagePickerController()
        cameraController.sourceType = sourceType
        cameraController.allowsEditing = true
        cameraController.delegate = delegate
        present(cameraController, animated: true, completion: nil)
        return true
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        dismiss(animated: true, completion: nil)
        
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.isTakeImage = true
            addPhotoButton.setImage(pickedImage, for: .normal)
            UserDefaults.standard.register(defaults: ["isTakeImage":UIImageJPEGRepresentation(pickedImage, 100)!])
            UserDefaults.standard.set(UIImageJPEGRepresentation(pickedImage, 100), forKey: "isTakeImage")


//            imgProfile.image = pickedImage
//            UserDefaults.standard.set(pickedImage, forKey: "isTakeImage")
            UserDefaults.standard.synchronize()
        }
    }
   
    
}


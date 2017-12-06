//
//  HomeButtonVC.swift
//  Whoop!
//
//  Created by Dilip Manek on 07/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

//MARK: - View Controller
class HomeButtonVC: UIViewController,UIScrollViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    //Outlets
    private var cameraController = UIImagePickerController()
    //MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Tapped Events
    @IBAction func tappedOnControlChangeAddress(_ sender: Any) {
    }
    
    @IBAction func tappedOnControlDeleteYourself(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapAddPhotoButton(_ sender: Any) {
        getPhotoLibrary()
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
            UserDefaults.standard.register(defaults: ["isTakeImage":UIImageJPEGRepresentation(pickedImage, 100)!])
            UserDefaults.standard.set(UIImageJPEGRepresentation(pickedImage, 100), forKey: "isTakeImage")
            UserDefaults.standard.synchronize()
        }
    }
    
}

//
//  TimeLineViewController.swift
//  Moments
//
//  Created by Dönör Raja on 1/19/17.
//  Copyright © 2017 calibraint. All rights reserved.
//

import UIKit
import Sharaku

class TimeLineViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var pickedImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func openCamera(_ sender: AnyObject) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        var action = UIAlertAction(title: "Take Photo", style: UIAlertActionStyle.default, handler: {action -> Void in
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
            else{
                
                let alert = UIAlertController(title: nil, message: "Camera not supported", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: {action -> Void in
                    
                })
                alert.addAction(action)
                
                self.present(alert, animated: true, completion: nil)
            }
            
        })
        actionSheet.addAction(action)
        
        action = UIAlertAction(title: "Photo Library", style: UIAlertActionStyle.default, handler: {action -> Void in
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
                imagePicker.allowsEditing = true
                self.present(imagePicker, animated: true, completion: nil)
            }
            
        })
        actionSheet.addAction(action)
        
        action = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: {action -> Void in
            
        })
        actionSheet.addAction(action)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = moments.title.timeLineTitle
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: moments.title.menuTitle, style: .plain, target: self, action: #selector(SSASideMenu.presentRightMenuViewController))
        NotificationCenter.default.addObserver(self, selector: #selector(SettingsViewController.methodOfReceivedNotification), name:NSNotification.Name(rawValue: moments.notification.notificationIdentifier), object: nil)
    }
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!){
        self.dismiss(animated: true, completion: nil)
        let imageFiltered = image
        let vc = SHViewController(image: imageFiltered!)
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }

    @IBAction func back(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func methodOfReceivedNotification(notification: NSNotification){
        Utility.logoutAction(viewController: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TimeLineTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "timeLineCell") as! TimeLineTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
   
}

extension TimeLineViewController: SHViewControllerDelegate {
    func shViewControllerImageDidFilter(image: UIImage) {
        // Filtered image will be returned here.
        pickedImage.image = image
    }
    
    func shViewControllerDidCancel() {
        // This will be called when you cancel filtering the image.
    }
}

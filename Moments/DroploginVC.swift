//
//  DroploginVC.swift
//  Moments
//
//  Created by cloudmaxis on 24/01/17.
//  Copyright © 2017 calibraint. All rights reserved.
//

import UIKit
import SwiftyDropbox
class DroploginVC: UIViewController {

    @IBOutlet weak var dropboxloginbutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func dropboxLogin(_ sender: Any) {
        if DropboxClientsManager.authorizedClient == nil
        {
            self.myButtonInControllerPressed()
        }
        else
        {
            let alertController = UIAlertController(title: "Login", message:
                "User is already authorized!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.destructive,handler: { action in
                
            }))
            
        }
       
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
               if let authResult = DropboxClientsManager.handleRedirectURL(url) {
                        switch authResult {
                        case .success:
                                   print("Success! User is logged into Dropbox.")
                           case .cancel:
                                    print("Authorization flow was manually canceled by user!")
                           case .error(_, let description):
                                   print("Error: \(description)")
                          }
                   }
                return true
           }
    func myButtonInControllerPressed() {
               DropboxClientsManager.authorizeFromController(UIApplication.shared,
                                                                  controller: self,
                                                                  openURL: { (url: URL) -> Void in
                                                                    UIApplication.shared.openURL(url)
                    })
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

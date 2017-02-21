//
//  SettingsViewController.swift
//  Moments
//
//  Created by Dönör Raja on 1/19/17.
//  Copyright © 2017 calibraint. All rights reserved.
//

import UIKit
import SwiftyDropbox

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = moments.title.settingsTitle
        view.backgroundColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: moments.title.menuTitle, style: .plain, target: self, action: #selector(SSASideMenu.presentRightMenuViewController))
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(SettingsViewController.methodOfReceivedNotification), name:NSNotification.Name(rawValue: moments.notification.notificationIdentifier), object: nil)
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
    
    @IBAction func Button(_ sender: UIButton) {
        self.myButtonInControllerPressed()
    }
    func myButtonInControllerPressed() {
        DropboxClientsManager.authorizeFromController(UIApplication.shared,
                                                      controller: self,
                                                      openURL: { (url: URL) -> Void in
                                                        UIApplication.shared.openURL(url)
        })
    }
    
    func methodOfReceivedNotification(notification: NSNotification){
        Utility.logoutAction(viewController: self)
    }


}

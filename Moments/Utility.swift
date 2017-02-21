//
//  Utility.swift
//  Moments
//
//  Created by Varun Kumar on 25/01/17.
//  Copyright © 2017 calibraint. All rights reserved.
//

import Foundation
import UIKit
import FBSDKLoginKit

class Utility: NSObject {
    
    class func moveToHomeScreen() {
        
        let timeLineView = UIStoryboard(name: moments.storyBord.name, bundle: nil).instantiateViewController(withIdentifier:moments.storyBord.homeView) as! HomeViewController
        if let window = UIApplication.shared.delegate?.window {
            window!.rootViewController = timeLineView
        }
    }
    
    class func logoutAction(viewController: UIViewController){
        
        let alert=UIAlertController(title: moments.alert.logoutTitle, message: moments.alert.logoutMessage, preferredStyle: UIAlertControllerStyle.alert);
        alert.addAction(UIAlertAction(title: moments.alert.noTitle, style: UIAlertActionStyle.cancel, handler: nil));
        alert.addAction(UIAlertAction(title: moments.alert.yesTitle, style: UIAlertActionStyle.default, handler: {(action:UIAlertAction) in
            let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
            fbLoginManager.logOut()
            for key in UserDefaults.standard.dictionaryRepresentation().keys {
                UserDefaults.standard.removeObject(forKey: key)
                NotificationCenter.default.removeObserver(self)
            }
            let timeLineView = UIStoryboard(name: moments.storyBord.name, bundle: nil).instantiateViewController(withIdentifier: moments.storyBord.loginView) as! LoginViewController
            if let window = UIApplication.shared.delegate?.window {
                window!.rootViewController = timeLineView
            }
        }));
        viewController.present(alert, animated: true, completion: nil);
    }
}

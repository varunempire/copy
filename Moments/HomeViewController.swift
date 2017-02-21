//
//  postedimageVC.swift
//  Moments
//
//  Created by cloudmaxis on 27/01/17.
//  Copyright © 2017 calibraint. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import PathMenu
class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    var imageArray = ["desert.jpeg","desert2.jpeg","desert3.jpeg","desert4.jpeg","desert.jpeg","desert2.jpeg","desert3.jpeg","desert4.jpeg","desert.jpeg","desert2.jpeg","desert3.jpeg","desert4.jpeg","desert.jpeg","desert2.jpeg","desert3.jpeg","desert4.jpeg",]
    @IBOutlet weak var imageCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: width / 2, height: width / 2)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        imageCollection!.collectionViewLayout = layout
    }
    
   
    //Use for interspacing
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1.0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell : ImageCell = imageCollection.dequeueReusableCell(withReuseIdentifier: moments.cell.imageCell, for : indexPath) as! ImageCell
        cell.userPostedImage.image = UIImage(named: imageArray[indexPath.item])
        return cell
    }
    @IBAction func logout(_ sender: AnyObject) {
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
        self.present(alert, animated: true, completion: nil);
    }

    @IBAction func upload(_ sender: AnyObject) {
        let timeline = storyboard?.instantiateViewController(withIdentifier:"timeLineView")
        self.navigationController?.pushViewController(timeline!, animated: true)
    }
    
    @IBAction func back(_ sender: AnyObject) {
        if let navController = self.navigationController {
            navController.dismiss(animated:true, completion: nil)
        }
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

import UIKit
import FBSDKLoginKit
import TwitterKit
class LoginViewController: UIViewController, UINavigationControllerDelegate {
    
    //Mark:- Outlets
    
    //Mark:- Variables
    var dict : NSDictionary!
    
    @IBOutlet weak var twitterLoginButton: UIButton!
    //Mark:- LifeCycleView
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Mark:- outletActions
    @IBAction func fbLogin(_ sender: AnyObject) {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        //fbLoginManager.loginBehavior = FBSDKLoginBehavior.Browser
        
        fbLoginManager.logIn(withReadPermissions: [moments.parameter.email], from: self, handler: { (result, error) -> Void in
            
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                
                if(fbloginresult.isCancelled) {
                    //Show Cancel alert
                } else if(fbloginresult.grantedPermissions.contains(moments.parameter.email)) {
                    self.getFBUserData()
                    //fbLoginManager.logOut()
                }
            }
        })

    }
    @IBAction func twitterLogin(_ sender: AnyObject) {
        Twitter.sharedInstance().logIn { (session, error) in
            if let unwrappedSession = session {
                let alert = UIAlertController(title: "Logged In",
                                              message: "User \(unwrappedSession.userName) has logged in",
                    preferredStyle: UIAlertControllerStyle.alert
                )
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                NSLog("Login error: %@", error!.localizedDescription);
            }
        }
    }
    //Mark:- OtherFunction
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: moments.parameter.me, parameters: [moments.parameter.fields: moments.parameter.params]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! NSDictionary
                    print(self.dict)
                    // self.navigationController?.isNavigationBarHidden = false
                    Utility.moveToHomeScreen()
                }
            })
        }
    }
    
}


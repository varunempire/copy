import Foundation
import UIKit
import FBSDKLoginKit

class RightMenuViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.frame = CGRect(x: 180, y: (self.view.frame.size.height - 54 * 2) / 2.0, width: self.view.frame.size.width, height: 54 * 3)
        tableView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth]
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isOpaque = false
        tableView.backgroundColor = UIColor.clear
        tableView.backgroundView = nil
        tableView.bounces = false
        return tableView
    }()
    
    var menuArray = [moments.menu.home, moments.menu.settings, moments.menu.logout]
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.clear
        view.addSubview(tableView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


// MARK : TableViewDataSource & Delegate Methods
extension RightMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 21)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text  = menuArray[indexPath.row]
        cell.selectionStyle = .none
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            let timeLineView = self.storyboard!.instantiateViewController(withIdentifier: "timeLineView") as! TimeLineViewController
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: timeLineView)
            sideMenuViewController?.hideMenuViewController()
            
        case 1:
            let settingsView = self.storyboard!.instantiateViewController(withIdentifier: "settingsView") as! SettingsViewController
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: settingsView)
            sideMenuViewController?.hideMenuViewController()
            
        case 2:
            
            sideMenuViewController?.hideMenuViewController()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NotificationIdentifier"), object: nil)
        default:
            break
        }
        
        
    }
    
}
    

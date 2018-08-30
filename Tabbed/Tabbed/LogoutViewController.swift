//
//  LogoutViewController.swift
//  Tabbed
//
//  Created by Johan Van Der Werff on 2018/08/29.
//  Copyright © 2018 Net1. All rights reserved.
//

import UIKit

class LogoutViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLogout(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        performSegue(withIdentifier: "pop2Root", sender: self)
        //self.navigationController?.popToRootViewController(animated: true)
    }
}

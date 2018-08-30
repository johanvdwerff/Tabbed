//
//  LoginViewController.swift
//  Tabbed
//
//  Created by Johan Van Der Werff on 2018/08/29.
//  Copyright © 2018 Net1. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        {
            performSegue(withIdentifier: "homeVC", sender: self)
        }
        
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        if txtUserName.text == "q" && txtPassword.text == "q"
        {
            //Navigate to app
            UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
            performSegue(withIdentifier: "homeVC", sender: self)
        }
        else
        {
            // Show alert
            let alert = UIAlertController(title: "Password Incorrect", message: "Please enter 'q' for both fields. LOL.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

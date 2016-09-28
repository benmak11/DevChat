//
//  LoginVC.swift
//  DevChat
//
//  Created by Baynham Makusha on 9/28/16.
//  Copyright © 2016 Ben Makusha. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailField: RoundTextField!
    @IBOutlet weak var passwordField: RoundTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func loginPressed(_ sender: AnyObject) {
        
        if let email = emailField.text, let pass = passwordField.text , (email.characters.count > 0 && pass.characters.count > 0) {
            
            // Call the login service
            AuthService.instance.login(email: email, password: pass)
            
        } else {
            
            let alert = UIAlertController(title: "Username and Password required!", message: "You must enter both a username and password to continue 🙂", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}

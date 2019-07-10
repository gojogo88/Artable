//
//  LoginVC.swift
//  Artable
//
//  Created by Jonathan Go on 2019/07/06.
//  Copyright © 2019 Appdelight. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

  @IBOutlet var emailTextField: UITextField!
  @IBOutlet var passwordTextField: UITextField!
  @IBOutlet var activityIndicator: UIActivityIndicatorView!
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  @IBAction func forgotPassButtonPressed(_ sender: Any) {
  }
  
  @IBAction func loginButtonPressed(_ sender: Any) {
    guard
      let email = self.emailTextField.text, email.isNotEmpty,
      let password = self.passwordTextField.text, password.isNotEmpty
      else {
        let simpleAlert = Alert.errorAlert(title: "Sign in Error", message: "Email and Passowrd can't be empty")
        present(simpleAlert, animated: true)
        
        return
    }
    
    activityIndicator.startAnimating()
    Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
      
      if let error = error {
        debugPrint(error.localizedDescription)
        self.handleFireAuthError(error: error)
        return
      }
      
      self.activityIndicator.stopAnimating()
      //print("Successfully logged in new user.")
      self.dismiss(animated: true, completion: nil)
    }
  }
  

  @IBAction func guestButtonPressed(_ sender: Any) {
  }
}

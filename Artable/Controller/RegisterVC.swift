//
//  RegisterVC.swift
//  Artable
//
//  Created by Jonathan Go on 2019/07/06.
//  Copyright © 2019 Appdelight. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {

  //MARK: - Outlets
  @IBOutlet var usernameTextField: UITextField!
  @IBOutlet var emailTextField: UITextField!
  @IBOutlet var passwordTextField: UITextField!
  @IBOutlet var confirmPassTextField: UITextField!
  @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
  override func viewDidLoad() {
    super.viewDidLoad()
   
  }
  
//  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//    self.view.endEditing(true)
//  }
  
  @IBAction func registerButtonPressed(_ sender: Any) {
    guard
      let username = self.usernameTextField.text, !username.isEmpty,
      let email = self.emailTextField.text, !email.isEmpty,
      let password = self.passwordTextField.text, !password.isEmpty
      //let confirm = self.confirmPassTextField.text, !confirm.isEmpty
    else {
      let simpleAlert = Alert.errorAlert(title: "Sign in Error", message: "Email and Passowrd can't be empty")
      present(simpleAlert, animated: true)
      
      return
    }
    
    Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
      
      if let error = error {
        debugPrint(error.localizedDescription)
        return
      }
      
      print("Successfully registered new user.")
    }
  }
}

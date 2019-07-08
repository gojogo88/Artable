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
  @IBOutlet var passCheckImage: UIImageView!
  @IBOutlet var confirmPassCheckImage: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
   
    passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    confirmPassTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
  }
  
  @objc func textFieldDidChange(_ textField: UITextField) {
    guard let passwordText = passwordTextField.text else { return }
    
    if textField == confirmPassTextField {
      passCheckImage.isHidden = false
      confirmPassCheckImage.isHidden = false
    } else {
      if passwordText.isEmpty {
        passCheckImage.isHidden = true
        confirmPassCheckImage.isHidden = true
        confirmPassTextField.text = ""
      }
    }
    
    if passwordTextField.text == confirmPassTextField.text {
      passCheckImage.image = UIImage(named: AppImages.GreenCheck)
      confirmPassCheckImage.image = UIImage(named: AppImages.GreenCheck)
    } else {
      passCheckImage.image = UIImage(named: AppImages.RedCheck)
      confirmPassCheckImage.image = UIImage(named: AppImages.RedCheck)
    }
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
  
  @IBAction func registerButtonPressed(_ sender: Any) {
    guard
      let username = self.usernameTextField.text, username.isNotEmpty,
      let email = self.emailTextField.text, email.isNotEmpty,
      let password = self.passwordTextField.text, password.isNotEmpty
    else {
      let simpleAlert = Alert.errorAlert(title: "Sign in Error", message: "Email and Passowrd can't be empty")
      present(simpleAlert, animated: true)
      
      return
    }
    
    activityIndicator.startAnimating()
    Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
      
      if let error = error {
        debugPrint(error.localizedDescription)
        return
      }
      
      self.activityIndicator.stopAnimating()
      print("Successfully registered new user.")
    }
  }
}

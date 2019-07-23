//
//  ForgetPasswordVC.swift
//  Artable
//
//  Created by Jonathan Go on 2019/07/10.
//  Copyright © 2019 Appdelight. All rights reserved.
//

import UIKit
import Firebase

class ForgetPasswordVC: UIViewController {

  //MARK: - Outlets
  @IBOutlet var emailTextField: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

  @IBAction func cancelButtonPressed(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func resetPasswordButtonPressed(_ sender: Any) {
    guard let email = emailTextField.text, email.isNotEmpty else {
      let simpleAlert = Alert.errorAlert(title: "Error", message: "Plese enter email.")
      present(simpleAlert, animated: true, completion: nil)
      
      return
    }
    
    Auth.auth().sendPasswordReset(withEmail: email) { (error) in
      if let error = error {
        debugPrint(error)
        Auth.auth().handleFireAuthError(error: error, vc: self)
        return
      }
      
      self.dismiss(animated: true, completion: nil)
    }
  }
  

}

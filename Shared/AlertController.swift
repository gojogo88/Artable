//
//  AlertController.swift
//  Artable
//
//  Created by Jonathan Go on 2019/07/06.
//  Copyright © 2019 Appdelight. All rights reserved.
//

import UIKit

struct Alert {
  static func errorAlert(title: String, message: String?, cancelButton: Bool = false, completion: (() -> Void)? = nil) -> UIAlertController {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let actionOK = UIAlertAction(title: "OK", style: .default) {
      _ in
      guard let completion = completion else { return }
      completion()
    }
    alert.addAction(actionOK)
    
    let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    if cancelButton { alert.addAction(cancel) }
    
    return alert
  }
}

/*
 // Creating alerts:
 let simpleAlert = Alert.errorAlert(title: "Sign in Error", message: "Email and Passowrd can't be empty")
 //let alertWithCompletionAndCancel = Alert.errorAlert(title: "Message", message: "Message", cancelButton: true) {
 // do something awesome
 //}
 
 // Presenting alerts:
 present(simpleAlert, animated: true)
 //present(alertWithCompletionAndCancel, animated: true)
*/

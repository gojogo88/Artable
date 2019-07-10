//
//  ViewController.swift
//  Artable
//
//  Created by Jonathan Go on 2019/07/06.
//  Copyright © 2019 Appdelight. All rights reserved.
//

import UIKit
import Firebase

class HomeVC: UIViewController {

  //MARK: - Outlets
  @IBOutlet var logInOutButton: UIBarButtonItem!
 
  override func viewDidLoad() {
    super.viewDidLoad()

    if Auth.auth().currentUser == nil {
      Auth.auth().signInAnonymously { (result, error) in
        if let error = error {
          debugPrint(error)
          self.handleFireAuthError(error: error)
        }
      }
    }
  }
  
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    if let user = Auth.auth().currentUser, !user.isAnonymous {
      logInOutButton.title = "Logout"
    } else {
      logInOutButton.title = "Login"
    }
  }
  @IBAction func logInOutButtonPressed(_ sender: Any) {
    guard let user = Auth.auth().currentUser else { return }
    
    if user.isAnonymous {
      presentLoginVC()
    } else {
      do {
        try Auth.auth().signOut()
        Auth.auth().signInAnonymously { (result, error) in
          if let error = error {
            debugPrint(error)
            self.handleFireAuthError(error: error)
          }
          self.presentLoginVC()
        }
      } catch {
        debugPrint(error)
        self.handleFireAuthError(error: error)
      }
    }
    
    
    
//    if let _ = Auth.auth().currentUser {
//      do {
//        try Auth.auth().signOut()
//        presentLoginVC()
//      } catch {
//        debugPrint(error.localizedDescription)
//      }
//    } else {
//      presentLoginVC()
//    }
  }
  
  fileprivate func presentLoginVC() {
    let storyboard = UIStoryboard(name: Storyboard.LoginStoryboard, bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: StoryboardId.LoginVC)
    present(controller, animated: true, completion: nil)
  }
}

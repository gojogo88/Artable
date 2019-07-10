//
//  Extensions.swift
//  Artable
//
//  Created by Jonathan Go on 2019/07/08.
//  Copyright © 2019 Appdelight. All rights reserved.
//

import UIKit
import Firebase

extension String {
  var isNotEmpty: Bool {
    return !isEmpty
  }
}

extension UIColor {
  static let myBlue = UIColor(named: "myBlue")!
  static let myRed = UIColor(named: "myRed")!
  static let myWhite = UIColor(named: "myWhite")!
}

extension UIViewController {
 
  func handleFireAuthError(error: Error) {
    if let errorCode = AuthErrorCode(rawValue: error._code) {
      let errorAlert = Alert.errorAlert(title: "Error", message: errorCode.errorMesage)
      present(errorAlert, animated: true, completion: nil)
    }
  }
}

extension AuthErrorCode {
  var errorMesage: String {
    switch self {
    case .emailAlreadyInUse:
      return "The email is already in use with another account. Pick another email."
    case .userNotFound:
      return "Account not found for the specified user. Please check and try again."
    case .userDisabled:
      return "Your account has been disabled. Please contact support."
    case .invalidEmail, .invalidSender, .invalidRecipientEmail:
      return "Please enter a valid email."
    case .networkError:
      return " Network error. Please try again."
    case .weakPassword:
      return "Your password is too weak. The password must be at least 6 characters long."
    case .wrongPassword:
      return "Your password or email is incorrect."
    default:
      return "Sorry, something went wrong."
    }
  }
}

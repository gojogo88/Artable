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

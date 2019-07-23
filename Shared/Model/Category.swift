//
//  Category.swift
//  Artable
//
//  Created by Jonathan Go on 2019/07/10.
//  Copyright © 2019 Appdelight. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Category {
  var name: String
  var id: String
  var imgUrl: String
  var isActive: Bool = true
  var timeStamp: Timestamp
  
  init(data: [String: Any]) {
  self.name = data["name"] as? String ?? ""
  self.id = data["id"] as? String ?? ""
  self.imgUrl = data["imgUrl"] as? String ?? ""
  self.isActive = data["isActive"] as? Bool ?? true
  self.timeStamp = data["timeStamp"] as? Timestamp ?? Timestamp()
  }
}

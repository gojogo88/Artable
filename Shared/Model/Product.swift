//
//  Product.swift
//  Artable
//
//  Created by Jonathan Go on 2019/07/12.
//  Copyright © 2019 Appdelight. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Product {
  var name: String
  var id: String
  var category: String
  var price: Double
  var productDescription: String
  var imageUrl: String
  var timeStamp: Timestamp
  var stock: Int
  var isFavorite: Bool
}

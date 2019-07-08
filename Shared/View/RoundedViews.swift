//
//  RoundedViews.swift
//  Artable
//
//  Created by Jonathan Go on 2019/07/08.
//  Copyright © 2019 Appdelight. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
  override func awakeFromNib() {
    super.awakeFromNib()
    layer.cornerRadius = 5
  }
}

class RoundedShadowView: UIView {
  override func awakeFromNib() {
    super.awakeFromNib()
    layer.cornerRadius = 5
    layer.shadowColor = UIColor.myBlue.cgColor
    layer.shadowOpacity = 0.4
    layer.shadowOffset = CGSize.zero
    layer.shadowRadius = 3
  }
}

class RoundedImageView: UIImageView {
  override func awakeFromNib() {
    super.awakeFromNib()
    layer.cornerRadius = 5
  }
}

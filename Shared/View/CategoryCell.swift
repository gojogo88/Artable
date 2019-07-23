//
//  CategoryCell.swift
//  Artable
//
//  Created by Jonathan Go on 2019/07/10.
//  Copyright © 2019 Appdelight. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryCell: UICollectionViewCell {

  //MARK: - Outlets
  @IBOutlet var categoryImage: RoundedImageView!
  @IBOutlet var categoryLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  func configureCell(category: Category) {
    categoryLabel.text = category.name
    if let url = URL(string: category.imgUrl) {
      let placeholder = UIImage(named: "placeholder")
      let options: KingfisherOptionsInfo = [KingfisherOptionsInfoItem.transition(.fade(0.1))]
      categoryImage.kf.indicatorType = .activity
      categoryImage.kf.setImage(with: url, placeholder: placeholder, options: options)
    }
  }
}

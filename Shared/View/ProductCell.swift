//
//  ProductCell.swift
//  Artable
//
//  Created by Jonathan Go on 2019/07/12.
//  Copyright © 2019 Appdelight. All rights reserved.
//

import UIKit
import Kingfisher

class ProductCell: UITableViewCell {

  @IBOutlet var productImage: RoundedImageView!
  @IBOutlet var productTitle: UILabel!
  @IBOutlet var productPrice: UILabel!
  @IBOutlet var favoriteButton: UIButton!
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  func configureCell(product: Product) {
    productTitle.text = product.name
    //productPrice.text = String(product.price)
    if let url = URL(string: product.imageUrl) {
      productImage.kf.setImage(with: url)
    }
    
  }
  
  @IBAction func favoriteButtonClicked(_ sender: Any) {
  }
  
  @IBAction func addToCartButtonClicked(_ sender: Any) {
  }
  
}

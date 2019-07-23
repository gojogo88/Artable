//
//  ProductsVC.swift
//  Artable
//
//  Created by Jonathan Go on 2019/07/12.
//  Copyright © 2019 Appdelight. All rights reserved.
//

import UIKit
import Firebase

class ProductsVC: UIViewController {

  //MARK: - Outlets
  @IBOutlet var tableView: UITableView!
  
  //MARK:- Variables
  var products = [Product]()
  var category: Category!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      let product = Product.init(name: "Landscape", id: "asdfwe", category: "Nature", price: 24.99, productDescription: "What a lovely landscape", imageUrl: "https://images.unsplash.com/photo-1562757725-c7bc201722a2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60", timeStamp: Timestamp(), stock: 0, isFavorite: false)
      products.append(product)
      
      tableView.dataSource = self
      tableView.delegate = self
      tableView.register(UINib(nibName: Identifiers.ProductCell, bundle: nil), forCellReuseIdentifier: Identifiers.ProductCell)
  }
    

  

}

extension ProductsVC: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return products.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.ProductCell, for: indexPath) as? ProductCell {
      cell.configureCell(product: products[indexPath.row])
      
      return cell
    }
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
  }
}

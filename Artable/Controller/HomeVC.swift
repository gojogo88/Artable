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
  @IBOutlet var collectionView: UICollectionView!
  @IBOutlet var activityIndicator: UIActivityIndicatorView!
  
  //MARK: - Variables
  var categories = [Category]()
  var selectedCategory: Category!
  var db: Firestore!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    db = Firestore.firestore()
    
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(UINib(nibName: Identifiers.CategoryCell, bundle: nil), forCellWithReuseIdentifier: Identifiers.CategoryCell)
    
    if Auth.auth().currentUser == nil {
      Auth.auth().signInAnonymously { (result, error) in
        if let error = error {
          debugPrint(error)
          Auth.auth().handleFireAuthError(error: error, vc: self)
        }
      }
    }
    
    //fetchDocument()
    fetchCollection()
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
            Auth.auth().handleFireAuthError(error: error, vc: self)
          }
          self.presentLoginVC()
        }
      } catch {
        debugPrint(error)
        Auth.auth().handleFireAuthError(error: error, vc: self)
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
  
  /* Fetch single document
  fileprivate func fetchDocument() {
    let docRef = db.collection("categories").document("Jcm1TCcdVTfpgSZm8rUu")
    docRef.getDocument { (snap, error) in
      guard let data = snap?.data() else { return }
      
      let newCat = Category.init(data: data)
      self.categories.append(newCat)
      self.collectionView.reloadData()
    }
  }
 */
  
  fileprivate func fetchCollection() {
    let collectionRef = db.collection("categories")
    
    collectionRef.getDocuments { (snap, error) in
      guard let documents = snap?.documents else { return }
      for document in documents {
        let data = document.data()
        let newCat = Category.init(data: data)
        self.categories.append(newCat)
      }
      self.collectionView.reloadData()
    }
  }
  
  fileprivate func presentLoginVC() {
    let storyboard = UIStoryboard(name: Storyboard.LoginStoryboard, bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: StoryboardId.LoginVC)
    present(controller, animated: true, completion: nil)
  }
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categories.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.CategoryCell, for: indexPath) as? CategoryCell {
      cell.configureCell(category: categories[indexPath.item])
      return cell
    }
    return UICollectionViewCell()
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = view.frame.width
    let cellWIdth = (width - 30) / 2
    let cellHeight = cellWIdth * 1.5
    
    return CGSize(width: cellWIdth, height: cellHeight)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    selectedCategory = categories[indexPath.item]
    performSegue(withIdentifier: Segues.toProducts, sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == Segues.toProducts {
      if let destination = segue.destination as? ProductsVC {
        destination.category = selectedCategory
      }
    }
  }
}

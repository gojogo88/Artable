//
//  ViewController.swift
//  Artable
//
//  Created by Jonathan Go on 2019/07/06.
//  Copyright © 2019 Appdelight. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    let storyboard = UIStoryboard(name: Storyboard.LoginStoryboard, bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: StoryboardId.LoginVC)
    present(controller, animated: true, completion: nil)
  }

  

}

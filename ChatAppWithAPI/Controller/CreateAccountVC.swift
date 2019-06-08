//
//  CreateAccountVC.swift
//  ChatAppWithAPI
//
//  Created by Huy Vu on 6/7/19.
//  Copyright © 2019 Huy Vu. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func closeCreateAccPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
}

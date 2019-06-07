//
//  ChannelVC.swift
//  ChatAppWithAPI
//
//  Created by Huy Vu on 6/6/19.
//  Copyright © 2019 Huy Vu. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    
    //outlets
    @IBOutlet weak var loginBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60 //set cho rear view khi hiện ra thì front view width chỉ còn 60
        
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    

}

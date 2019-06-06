//
//  ChannelVC.swift
//  ChatAppWithAPI
//
//  Created by Huy Vu on 6/6/19.
//  Copyright © 2019 Huy Vu. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60 //set cho rear view khi hiện ra thì front view width chỉ còn 60
        
    }


}

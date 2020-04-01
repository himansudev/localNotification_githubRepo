//
//  SecondViewController.swift
//  notifiaction
//
//  Created by Himansu Sekhar Panigrahi on 02/04/20.
//  Copyright © 2020 hpApps. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController
{
let label = UILabel()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        
        //label.text = "Wow That Great >>>>>>>"
        label.backgroundColor = UIColor.green
        label.frame = CGRect(origin: self.view.center, size: CGSize(width: 400, height: 500))
        
        self.view.addSubview(label)
       
    }
    

   

}

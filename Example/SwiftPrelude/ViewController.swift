//
//  ViewController.swift
//  SwiftPrelude
//
//  Created by sy on 04/16/2018.
//  Copyright (c) 2018 sy. All rights reserved.
//

import UIKit
import SwiftPrelude

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad() 
        
        view
            |> \.tag … 1
            <> \.backgroundColor … .green
            <> \.layer.cornerRadius … 2.0
            <> \UIView.layer.borderColor … UIColor.red.cgColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


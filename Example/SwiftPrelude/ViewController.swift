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
        // Do any additional setup after loading the view, typically from a nib.
        
        let x = concat(["1","2","3","4"], "!")
        print(x)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


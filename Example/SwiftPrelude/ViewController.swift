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
    }
    
    private func testZip() {
        let array1 = ["1", "2", "3"]
        let array2 = [4, 5, 6, 7, 8]
        let array3 = ["AAA", "BBB"]
        let r2 = zip2(array1, array2)
        let r3 = zip3(array1, array2, array3)
        let r2f = zip2(with: { "\($0) \($1)!"} )(array1, array2)
        print(r2f)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


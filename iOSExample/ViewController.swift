//
//  ViewController.swift
//  iOSExample
//
//  Created by Victor Vasilica on 4/29/15.
//  Copyright (c) 2015 simple. All rights reserved.
//

import UIKit
import MetalMindKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let test = TestClass()
        println(test.aString)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

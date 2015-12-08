//
//  ViewController.swift
//  testgallery
//
//  Created by Ion Toderasco on 04/12/15.
//  Copyright © 2015 Tapptitude. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBAction func galleryAction(sender: UIButton) {
       // let controller = MainPage()
        let controller = PageSliderViewController()
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}


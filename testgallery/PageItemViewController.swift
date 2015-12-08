//
//  PageItemViewController.swift
//  testgallery
//
//  Created by Ion Toderasco on 07/12/15.
//  Copyright © 2015 Tapptitude. All rights reserved.
//

import UIKit

class PageItemViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageTitleLabel: UILabel!
    
    var pageIndex: Int!
    var titleText: String!
    var imageFile: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = UIImage(named: self.imageFile)
        self.imageTitleLabel.text = self.titleText
    }

}

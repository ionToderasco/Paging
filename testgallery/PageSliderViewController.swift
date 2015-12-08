//
//  PageSliderViewController.swift
//  testgallery
//
//  Created by Ion Toderasco on 07/12/15.
//  Copyright © 2015 Tapptitude. All rights reserved.
//

import UIKit

class PageSliderViewController: UIViewController, UIPageViewControllerDataSource {

    var pageViewController: UIPageViewController!
    
    var imageTitle: NSArray!
    var imageContent: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageTitle = NSArray(objects: "titlu1", "titlu2")
        self.imageContent = NSArray(objects: "nature_pic_3", "nature_pic_4")
        
        //self.pageViewController = UIPageViewController()
        self.pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        self.pageViewController.dataSource = self
        
        let startController = self.viewControllerAtIndex(0) 
        let viewControllers = NSArray(object: startController) as! [UIViewController]
        
        self.pageViewController.setViewControllers(viewControllers, direction: .Forward, animated: true, completion: nil)
        self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.size.height)
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
    }
    
    func viewControllerAtIndex(index: Int) -> PageItemViewController {
        
        if ((self.imageTitle.count == 0) || (index >= self.imageTitle.count)) {
            return PageItemViewController()
        }
    
        let viewController = PageItemViewController()
        
        viewController.imageFile = self.imageContent[index] as! String
        viewController.titleText = self.imageTitle[index] as! String
        viewController.pageIndex = index
        
        return viewController
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let controller = viewController as! PageItemViewController
        var index = controller.pageIndex as Int
        
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index--
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let controller = viewController as! PageItemViewController
        var index = controller.pageIndex as Int
        
        if (index == NSNotFound) {
            return nil
        }
        
        index++
        
        if (index == self.imageTitle.count){
            return nil
        }
        
        return self.viewControllerAtIndex(index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.imageTitle.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}

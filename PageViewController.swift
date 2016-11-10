//
//  PageViewController.swift
//  Deloitte
//
//  Created by Roberto Gutierrez on 09/11/16.
//  Copyright © 2016 Roberto Gutierrez. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    //  var pageHeadings = ["Personalize", "Locate", "Discover"]
    var pageImages = ["intro1", "intro2", "intro3"]
    var pageControl : UIPageControl!
    // var pageSubHeadings = ["Pin your favourite restaurants and create your own food guide", "Search and locate your favourite restaurant on Maps", "Find restaurants pinned by your friends and other foodies around the world"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth = self.view.frame.size.width
        let screenHeight = self.view.frame.size.height
      //  pageControl = UIPageControl(frame: CGRectMake((screenWidth / 2) - 100, 70, 200, 20))
        pageControl = UIPageControl(frame: CGRect(x:(screenWidth / 2) - 100, y: screenHeight - 50, width:200, height:20))
        self.pageControl.numberOfPages = pageImages.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.red
        self.pageControl.pageIndicatorTintColor = UIColor.lightGray
        self.pageControl.currentPageIndicatorTintColor = UIColor.white
        self.view.addSubview(pageControl)
        
        dataSource = self
        
        // Create the first walkthrough screen
        if let startingViewController = self.viewControllerAtIndex(index: 0) {
            
            setViewControllers([startingViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! PageContentViewController).index
        
        index += 1
        self.pageControl.currentPage = index - 1
        return self.viewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! PageContentViewController).index
        
        index -= 1
        self.pageControl.currentPage = index + 1
        return self.viewControllerAtIndex(index: index)
    }
    
    func viewControllerAtIndex(index: Int) -> PageContentViewController? {
        
        if index == NSNotFound || index < 0 || index >= self.pageImages.count {
            return nil
        }
        
        //self.pageControl.currentPage = index
        
        // Create a new view controller and pass suitable data.
        
        if let pageContentViewController = storyboard?.instantiateViewController(withIdentifier: "PageContentViewController") as? PageContentViewController {
            
            //  pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.imageFile = pageImages[index]
            
            //  pageContentViewController.subHeading = pageSubHeadings[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        
        return nil
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

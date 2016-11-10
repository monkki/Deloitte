//
//  PageContentViewController.swift
//  Deloitte
//
//  Created by Roberto Gutierrez on 09/11/16.
//  Copyright © 2016 Roberto Gutierrez. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {
    
    @IBOutlet weak var contentImageView:UIImageView!
    @IBOutlet weak var pageControl:UIPageControl!
    
    @IBOutlet var ingresaBoton: UIButton!
    
    
    var index : Int = 0
    var heading : String = ""
    var imageFile : String = ""
    var subHeading : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingresaBoton.isHidden = (index == 2) ? false :  true
        
        
        
        pageControl.currentPage = index
        pageControl.isHidden = true
        
        
        // subHeadingLabel.text = subHeading
        contentImageView.image = UIImage(named: imageFile)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Funcion botones
    
    @IBAction func ingresaBotonPresionado(sender: AnyObject) {
        
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: "hasViewedWalkthrough")
        
        self.dismiss(animated: true, completion: nil)
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

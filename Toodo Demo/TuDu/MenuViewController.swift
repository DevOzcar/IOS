//
//  MenuViewController.swift
//  TuDu
//
//  Created by Oscar Borden on 21/12/16.
//  Copyright © 2016 SYE Software. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    let  appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "bg_menu.png")?.draw(in: self.view.bounds)
        
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func btnProfile(_ sender: Any) {

        let vc = storyboard?.instantiateViewController(withIdentifier: "vcProfile") as! ProfileViewController
        
        appDelegate.mContainer?.centerViewController = UINavigationController(rootViewController: vc)
        appDelegate.mContainer?.closeDrawer(animated: true, completion: nil)
    }
    
    @IBAction func btnHome(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "vcHome") as! HomeViewController
    
        appDelegate.mContainer?.centerViewController = UINavigationController(rootViewController: vc)
        appDelegate.mContainer?.closeDrawer(animated: true, completion: nil)
    }

    @IBAction func btnContact(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "vcContact") as! ContactViewController
        
        appDelegate.mContainer?.centerViewController = UINavigationController(rootViewController: vc)
        appDelegate.mContainer?.closeDrawer(animated: true, completion: nil)
    }
    
    @IBAction func btnNotification(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "vcNotification") as! NotificationTableViewController
        
        appDelegate.mContainer?.centerViewController = UINavigationController(rootViewController: vc)
        appDelegate.mContainer?.closeDrawer(animated: true, completion: nil)
    }

    @IBAction func btnAbout(_ sender: Any) {
    }
    @IBAction func btnLogOut(_ sender: Any) {
    }
    
}

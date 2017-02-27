//
//  SuccessViewController.swift
//  TuDu
//
//  Created by Oscar Borden on 12/01/17.
//  Copyright © 2017 SYE Software. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "bg_success.png")?.draw(in: self.view.bounds)
        
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnOk(_ sender: UIButton) {
        
        let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
         UIApplication.shared.keyWindow?.rootViewController = appDelegate.mContainer
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
  

}

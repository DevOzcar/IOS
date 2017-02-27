//
//  RegisterViewController.swift
//  TuDu
//
//  Created by Oscar Borden on 20/12/16.
//  Copyright © 2016 SYE Software. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet var mView: UIView!
    @IBOutlet weak var btnRegister: UIButton!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "bg_back.png")?.draw(in: self.view.bounds)
        
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.mView.backgroundColor = UIColor(patternImage: image)
        setStyleButton()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        self.view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setStyleButton(){
        let cButton =  UIButton()
        cButton.setUpLayer(btnLocal: btnRegister)
    }
    
    @IBAction func btnRegister(_ sender: UIButton) {
        openHome()
    }
    
    func openHome(){
        /*let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        UIApplication.shared.keyWindow?.rootViewController = appDelegate.mContainer*/
        
        self.performSegue(withIdentifier: "sgSuccess", sender: nil)
    }
}

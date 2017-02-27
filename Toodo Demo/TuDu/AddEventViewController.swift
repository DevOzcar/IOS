//
//  AddEventViewController.swift
//  TuDu
//
//  Created by Oscar Borden on 22/12/16.
//  Copyright © 2016 SYE Software. All rights reserved.
//

import UIKit
import DatePickerDialog
import DateTimePicker


class AddEventViewController: UIViewController {
    
    @IBOutlet weak var tHora: UITextField!
    @IBOutlet weak var tDate: UITextField!
    @IBOutlet weak var tName: UITextField!
    
    
    let dateFormatter = DateFormatter()
    var tmpDate: NSDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tDate.addTarget(self, action:#selector(pickDate), for: UIControlEvents.touchDown)
        tHora.addTarget(self, action:#selector(pickDate), for: UIControlEvents.touchDown)
        
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
    
    @IBAction func btnSave(_ sender: UIBarButtonItem) {
   
        var event = Evento.create() as! Evento // Downcasts are necessary,
        event.when = tmpDate
        event.name = tName.text!
        event.save()
        
        let  appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let vc = storyboard?.instantiateViewController(withIdentifier: "vcHome") as! HomeViewController
        
        appDelegate.mContainer?.centerViewController = UINavigationController(rootViewController: vc)
        appDelegate.mContainer?.closeDrawer(animated: true, completion: nil)
    }
    
    func pickDate(textField: UITextField) {
        /*DatePickerDialog().show(title: "Fecha", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
         (date) -> Void in
         
         if date != nil {
         self.tDate.text = self.dateFormatter.string(from: date!)
         }
         }*/
        
        let picker = DateTimePicker.show()
        picker.highlightColor = UIColor(red: 255.0/255.0, green: 138.0/255.0, blue: 138.0/255.0, alpha: 1)
        picker.completionHandler = { date in
            
            self.dateFormatter.dateFormat = "dd-MM-yyyy"
            self.tDate.text = self.dateFormatter.string(for: date)
            
            self.dateFormatter.dateFormat = "HH:mm a"
            self.tHora.text = self.dateFormatter.string(from: date)
            
            self.tmpDate = date as NSDate?
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBack(_ sender: UIBarButtonItem) {
        closeView()
    }
    
    
    func closeView(){
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
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

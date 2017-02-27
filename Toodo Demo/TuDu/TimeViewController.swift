//
//  TimeViewController.swift
//  TuDu
//
//  Created by Oscar Borden on 11/01/17.
//  Copyright © 2017 SYE Software. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {
    
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var txtTime: UILabel!
    
    @IBOutlet weak var lblTime: UILabel!
    var aEvento: [Evento] = []
    var indxEvento = 0
    var timer = Timer()
    var valMilis: Int = 0
    var valMin: Int = 0
    var valSeconds: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aEvento = Evento.all() as! [Evento]
        
        txtName.text = aEvento[indxEvento].name
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm a"
        txtTime.text = dateFormatter.string(from: aEvento[indxEvento].when as! Date)
        
        dateFormatter.dateFormat = "dd MMMM, yyyy"
        self.title = dateFormatter.string(for: aEvento[indxEvento].when)
        
        
      
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBack(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func btnStart(_ sender: Any) {
         timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(TimeViewController.timeActionTimeNotReverse),userInfo: nil, repeats: true)
    }
    
    func timeActionTimeNotReverse(){
        
        
        var txtSeg: String
        var txtMin: String
    
        
        if valMilis > 99{
            valSeconds += 1
            
            if valSeconds == 60{
                valMin += 1
                valSeconds = 0
            }
            
            txtSeg = String(valSeconds)
            txtMin = String(valMin)
            
            
            if valSeconds < 10{
                txtSeg = "0"+txtSeg
            }
            if valMin < 10{
                txtMin = "0"+txtMin
            }
            
            lblTime.text = txtMin + ":" + txtSeg
            valMilis = 0
            
        }
        valMilis += 1
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

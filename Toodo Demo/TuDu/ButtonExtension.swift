//
//  ButtonExtension.swift
//  TuDu
//
//  Created by Oscar Borden on 19/12/16.
//  Copyright © 2016 SYE Software. All rights reserved.
//

import UIKit

extension UIButton {
   
    func setUpLayer(btnLocal: UIButton?) {
       
        btnLocal?.tintColor =  UIColor.white
        btnLocal!.frame = CGRect(x:50, y:500, width:170, height:40)
        btnLocal!.layer.borderWidth = 1.0
        btnLocal!.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        btnLocal!.layer.cornerRadius = 5.0
        
        btnLocal!.layer.shadowRadius =  3.0
        btnLocal!.layer.shadowColor =  UIColor.white.cgColor
        btnLocal!.layer.shadowOpacity =  0.3
    }
    
}

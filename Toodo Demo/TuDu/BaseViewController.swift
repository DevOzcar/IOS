//
//  BaseViewController.swift
//  TuDu
//
//  Created by Oscar Borden on 20/12/16.
//  Copyright © 2016 SYE Software. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController{
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
            default:
                break
            }
        }
    }
    
    func currentDate() -> String{
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MMMM, yyyy"
        
        return  formatter.string(from: date).uppercased()
        
    }
}

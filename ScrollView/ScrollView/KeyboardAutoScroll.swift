//
//  KeyboardAutoScroll.swift
//  ScrollView
//
//  Created by Fco Junior on 9/25/16.
//  Copyright © 2016 Junior. All rights reserved.
//

import UIKit

class KeyboardAutoScroll: NSObject {
    private override init() { }
    
    private static var scrollView: UIScrollView?
    private static var view: UIView?
    private static var activeField: UITextField?
    
    class func setScrollView(scroll: UIScrollView) {
        self.scrollView = scroll
    }
    
    class func setView(view: UIView) {
        self.view = view
    }
    
    class func setTextField(field: UITextField) {
        self.activeField = field
    }
    
    class func registerForKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.keyboardWasShown), name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.keyboardWillBeHidden), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    class func keyboardWasShown(aNotification: NSNotification) {
        var info = aNotification.userInfo!
        let kbSize = info[UIKeyboardFrameBeginUserInfoKey]!.CGRectValue().size
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0)
        self.scrollView!.contentInset = contentInsets
        self.scrollView!.scrollIndicatorInsets = contentInsets
        var aRect = self.view!.frame
        aRect.size.height -= kbSize.height
        if !CGRectContainsPoint(aRect, self.activeField!.frame.origin) {
            self.scrollView!.scrollRectToVisible(self.activeField!.frame, animated: true)
        }
    }
    
    class func keyboardWillBeHidden(aNotification: NSNotification) {
        let contentInsets = UIEdgeInsetsZero
        self.scrollView!.contentInset = contentInsets
        self.scrollView!.scrollIndicatorInsets = contentInsets
    }
}

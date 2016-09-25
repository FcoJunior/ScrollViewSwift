//
//  ViewController.swift
//  ScrollView
//
//  Created by Fco Junior on 9/17/16.
//  Copyright © 2016 Junior. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.txtName.delegate = self
        self.txtEmail.delegate = self
        self.txtLastName.delegate = self
        self.txtPassword.delegate = self
        self.txtConfirmPassword.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        KeyboardAutoScroll.setView(self.containerView)
        KeyboardAutoScroll.setScrollView(self.scroll)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        KeyboardAutoScroll.setTextField(textField)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}


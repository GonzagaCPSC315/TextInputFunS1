//
//  ViewController.swift
//  TextInputFunS1
//
//  Created by Gina Sprint on 10/13/20.
//  Copyright © 2020 Gina Sprint. All rights reserved.
//

import UIKit

// MARK: - First Responder Status
// when you tap a text field, it becomes the "first responder" to keyboard events
// only way to get rid of the keyboard, is to have the text field "resign as first responder"
// where and when to do this?
// 1. tap on the background view
// need a UITapGestureRecognizer to do this
// 2. user presses the return key
// need a UITextFieldDelegate

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var textField: UITextField!
    
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        if let text = sender.text {
            if text != "" {
                label.text = text
            }
            else {
                label.text = "Enter text below"
            }
        }
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        print("background tapped")
        textField.resignFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


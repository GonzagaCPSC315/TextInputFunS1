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

// MARK: - Delegation
// delegation is a design pattern
// target action is a design pattern for handling a single event (e.g. callback)
// delegation is an OOP approach to event handling

// example for text field
// UITextField has a protocol called UITextFieldDelegate that has several optional callback methods in it
// a class like ViewController can conform to this protocol
// then implement the callbacks that it is interested in
// callbacks that notify the delegate about information changes
// callbacks that ask the delegate what to do (return Bool)
// ex: textFieldShouldReturn() -> Bool

// steps to setup delegation
// 1. ViewController conforms to UITextFieldDelegate protocol
// 2. let the textfield know about its delegate (ViewController)
// 3. ViewController provides implementations for the callbacks that it is interested in


class ViewController: UIViewController, UITextFieldDelegate {
    
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

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // this callback is executed when the user presses the return key on the keypad
        textField.resignFirstResponder()
        return true
    }

}


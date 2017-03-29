//
//  ViewController.swift
//  daredevil_register
//
//  Created by Sylvia Wan on 24/03/2017.
//  Copyright © 2017 Sylvia Wan. All rights reserved.
//


// Confirm password
// DOB

//


import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var dateOfBirth: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var userName: UITextField!

    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBAction func submitForm(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


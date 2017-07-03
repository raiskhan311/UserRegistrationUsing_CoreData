//
//  RegistrationVC.swift
//  UserRegistrationUsing_CoreData
//
//  Created by APPLE on 01/07/17.
//  Copyright © 2017 rsku. All rights reserved.
//

import UIKit
import CoreData

class RegistrationVC: UIViewController {

    
    @IBOutlet weak var txt_firstname: UITextField!
    
    @IBOutlet weak var txt_lastname: UITextField!
    
    @IBOutlet weak var txt_email: UITextField!
    
    @IBOutlet weak var txt_mobile: UITextField!
    
    @IBOutlet weak var txt_country: UITextField!
    
    @IBOutlet weak var txt_password: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btn_register(_ sender: UIButton) {
        CoreDataManager.SaveData_into_CoreData(firstname: txt_firstname.text!, lastname: txt_lastname.text!, email: txt_email.text!,mobile: txt_mobile.text!, country: txt_country.text!, password: txt_password.text!)
    }
}


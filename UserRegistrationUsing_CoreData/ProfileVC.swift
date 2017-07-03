//
//  ProfileVC.swift
//  UserRegistrationUsing_CoreData
//
//  Created by APPLE on 02/07/17.
//  Copyright © 2017 rsku. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    
    @IBOutlet weak var img_profile: UIImageView!

    @IBOutlet weak var lbl_name: UILabel!
    
    @IBOutlet weak var lbl_mobile: UILabel!
    
    @IBOutlet weak var lbl_email: UILabel!
    
    @IBOutlet weak var btn_Logout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func btn_Logout(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
        _ = navigationController?.popViewController(animated: true)
//        _ = navigationController?.popToRootViewController(animated: true)
    }
    
}

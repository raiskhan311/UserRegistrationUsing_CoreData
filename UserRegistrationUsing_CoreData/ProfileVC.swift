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
    
    @IBOutlet weak var lbl_countryName: UILabel!
    
    fileprivate var LoginUserDetailsArray = [userItem]()
    
    var namrString: String?
    var emailString: String?
    var mobilenumberString:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.isHidden = false
        lbl_email.text! = userloginEmail!
        fetchData()
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
    
    //MARK:- fetch data from CoreData
    func fetchData() {
        LoginUserDetailsArray = CoreDataManager.fetchData_from_CoreData()
        for item in 0..<LoginUserDetailsArray.count{
            let entity = LoginUserDetailsArray[item]
            if entity.email == userloginEmail!{
                lbl_name.text = String(entity.firstname+" "+entity.lastname)
                lbl_mobile.text = entity.mobile
                lbl_countryName.text = entity.country
            }
        }
    }
}

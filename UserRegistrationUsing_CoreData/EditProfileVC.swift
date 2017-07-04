//
//  EditProfileVC.swift
//  UserRegistrationUsing_CoreData
//
//  Created by mac on 04/07/17.
//  Copyright © 2017 rsku. All rights reserved.
//

import UIKit

class EditProfileVC: UIViewController {

    
    @IBOutlet weak var txt_userName: UITextField!
    
    @IBOutlet weak var txt_userMobileNumber: UITextField!
    
    @IBOutlet weak var txt_userEmail: UITextField!
    
    @IBOutlet weak var txt_userCountryName: UITextField!
    
    fileprivate var LoginUserDetailsArray = [userItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData() //calling function
        CoreDataManager.updateData_into_CoreData()
    }
    
    @IBAction func btn_EditProfileDone(_ sender: Any) {
    }
 
    
    //MARK:- fetch data from CoreData
    func fetchData() {
        LoginUserDetailsArray = CoreDataManager.fetchData_from_CoreData()
        for item in 0..<LoginUserDetailsArray.count{
            let entity = LoginUserDetailsArray[item]
            if entity.email == userloginEmail!{
                txt_userName.text = String(entity.firstname+" "+entity.lastname)
                txt_userMobileNumber.text = entity.mobile
                txt_userCountryName.text = entity.country
                txt_userEmail.text = entity.email
            }
        }
    }
}

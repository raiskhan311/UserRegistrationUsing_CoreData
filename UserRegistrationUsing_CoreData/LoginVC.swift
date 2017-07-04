//
//  LoginVC.swift
//  UserRegistrationUsing_CoreData
//
//  Created by APPLE on 01/07/17.
//  Copyright © 2017 rsku. All rights reserved.
//

import UIKit


var userloginEmail:String?
class LoginVC: UIViewController {
    
    @IBOutlet weak var txt_email: UITextField!
    
    @IBOutlet weak var txt_password: UITextField!
    
    var message:Bool?
    
    fileprivate var UserDetailsArray = [userItem]()

    var regemail = [String]()
    var regpassword = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
//        self.navigationController?.navigationBar.isHidden = false
//        self.navigationItem.backBarButtonItem?.isEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Action button
    @IBAction func btn_login(_ sender: UIButton) {
        for index in 0..<regemail.count{
            let (email,pass) = (regemail[index],regpassword[index])
            if txt_email.text! == email && txt_password.text! == pass{
                let mainStoryBoard = UIStoryboard(name: "ProfileVC", bundle: nil)
                let vc:ProfileVC = (mainStoryBoard.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC)!
                self.navigationController!.pushViewController(vc,animated:true)
//                self.present(vc, animated: true, completion: nil)
                userloginEmail = email
                print("Login Successfully")
                message = true
                break
            }else{
                message = false
                continue
            }
        }
        if message == false{
            print("invalid email or password")
        }
    }

    @IBAction func btn_Back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK:- fetch data from CoreData
    func fetchData() {
        UserDetailsArray = CoreDataManager.fetchData_from_CoreData()
        for item in 0..<UserDetailsArray.count{
            let entity = UserDetailsArray[item]
            regemail.append(entity.email)
            regpassword.append(entity.password)
        }
    }

}



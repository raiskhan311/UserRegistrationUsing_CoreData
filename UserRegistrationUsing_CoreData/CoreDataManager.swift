//
//  CoreDataManager.swift
//  UserRegistrationUsing_CoreData
//
//  Created by APPLE on 01/07/17.
//  Copyright © 2017 rsku. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    private class func getContext() -> NSManagedObjectContext
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    class func SaveData_into_CoreData(firstname:String,lastname:String,email:String,mobile:String,country:String,password:String)
    {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "UserEntity", in: context)
        let manageObj = NSManagedObject(entity: entity!, insertInto: context)
        
        manageObj.setValue(firstname, forKey: "firstname")
        manageObj.setValue(lastname, forKey: "lastname")
        manageObj.setValue(email, forKey: "email")
        manageObj.setValue(mobile, forKey: "mobile")
        manageObj.setValue(country, forKey: "country")
        manageObj.setValue(password, forKey: "password")
        
        do
        {
            try context.save()
            print("saved")
        }
        catch
        {
            print(error.localizedDescription)
        }
    }
    
    class func fetchData_from_CoreData() -> [userItem]
    {
        var array = [userItem]()
        
        let fetchRequest:NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        do
        {
            let fetchResult = try getContext().fetch(fetchRequest)
//            print(fetchResult)
            for item in fetchResult
            {
                let credential = userItem(firstname: item.firstname!, lastname: item.lastname!, email: item.email!, mobile: item.mobile!, country: item.country!, password: item.password!)
                array.append(credential)
                print("firstname: " + credential.firstname!+"|"+" lastname:" + credential.lastname!+"|"+" email:" + credential.email!+"|"+" mobile:" + credential.mobile!+"|"+" country:" + credential.country!+"|"+" password:" + credential.password!)
            }
        }
        catch
        {
            print("some erro accur while fetching data")
        }
        return array
    }

}

struct userItem {
    var firstname:String!
    var lastname:String!
    var email:String!
    var mobile:String!
    var country:String!
    var password:String!
    
    init() {
        firstname = ""
        lastname = ""
        email = ""
        mobile = ""
        country = ""
        password =  ""
    }
    init(firstname:String!,lastname:String!,email:String!,mobile:String!,country:String!,password:String!){
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.mobile = mobile
        self.country = country
        self.password = password
    }
}

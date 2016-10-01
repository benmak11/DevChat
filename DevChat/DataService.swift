//
//  DataService.swift
//  DevChat
//
//  Created by Baynham Makusha on 9/28/16.
//  Copyright © 2016 Ben Makusha. All rights reserved.
//

let FIR_CHILD_USERS = "users"

import Foundation
import FirebaseDatabase

class DataService {
    
    //Creating our singleton instance
    private static let _instance = DataService()
    
    static var instance: DataService {
        return _instance
    }
    
    // Grabbing the reference to your specific App database
    var mainRef: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    var usersRef: FIRDatabaseReference {
        return mainRef.child(FIR_CHILD_USERS)
    }
    
    func saveUser(uid: String) {
        let profile: Dictionary<String, Any> = ["firstName": "", "lastName": ""]
        mainRef.child("users").child(uid).child("profile").setValue(profile)
    }
    
}
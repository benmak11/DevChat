//
//  User.swift
//  DevChat
//
//  Created by Baynham Makusha on 10/1/16.
//  Copyright © 2016 Ben Makusha. All rights reserved.
//

import UIKit

struct User {
    private var _firstName: String
    private var _uid: String
    
    var uid: String{
        return _uid
    }
    
    var firstName: String {
        return _firstName
    }
    
    init(uid: String, firstName: String){
        _uid = uid
        _firstName = firstName
    }
}

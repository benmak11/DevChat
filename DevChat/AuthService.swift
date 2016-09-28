//
//  AuthService.swift
//  DevChat
//
//  Created by Baynham Makusha on 9/28/16.
//  Copyright © 2016 Ben Makusha. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

typealias Completion = (_ errMsg: String?, _ data: AnyObject?) -> Void

class AuthService {
    
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func login(email: String, password: String, onComplete: Completion?) {
     
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                if let errorCode = FIRAuthErrorCode(rawValue: error!._code) {
                    if errorCode == .errorCodeUserNotFound {
                        
                        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil {
                                //Show error to user
                                self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                            }else {
                                //Success creating user
                                if user?.uid != nil {
                                    
                                    DataService.instance.saveUser(uid: user!.uid)
                                    
                                    //Sign in
                                    FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                                        if error != nil {
                                            //Show error to user
                                            self.handleFirebaseError(error: error as! NSError, onComplete: onComplete)
                                        } else {
                                            // We have successfully logged in
                                            onComplete?(_ : nil, _ : user)
                                        }
                                    })
                                }
                            }
                        })
                    }
                } else {
                    //Handle all other errors
                    self.handleFirebaseError(error: error as! NSError, onComplete: onComplete)
                }
            } else {
                // Successfully logged in
                onComplete?(_ : nil, _ : user)
            }
        })
    }
    
    func handleFirebaseError(error: NSError, onComplete: Completion?) {
        
        print(error.debugDescription)
        if let errorCode = FIRAuthErrorCode(rawValue: error.code) {
            switch (errorCode) {
            case .errorCodeInvalidEmail:
                onComplete?(_ : "Invalid email address", _ : nil)
                break
            case .errorCodeWrongPassword:
                onComplete?(_ : "Invalid password", _ : nil)
                break
            case .errorCodeEmailAlreadyInUse, .errorCodeAccountExistsWithDifferentCredential:
                onComplete?(_ : "Could not create account. Email already in use", _ : nil)
                break
            default:
                onComplete?(_ : "There was a problem authenticaticating. Try again.", _ : nil)
            }
        }
    }
    
    
}

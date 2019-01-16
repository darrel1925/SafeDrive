//
//  LoginPage.swift
//  Watch My Back
//
//  Created by Darrel Muonekwu on 1/12/19.
//  Copyright © 2019 Darrel Muonekwu. All rights reserved.
//

import UIKit
import FirebaseDatabase





class LoginPage: UIViewController, UITextFieldDelegate {
    
    var signUpModeActive = true
    var value = [String : AnyObject]()
    var username = ""
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signupOrLoginOutlet: UIButton!
    @IBOutlet weak var switchLoginModeOutlet: UIButton!
    @IBOutlet weak var haveAnAccountLabel: UILabel!
    @IBOutlet weak var continueOutlet: UIButton!
    
    
    var ref: DatabaseReference!
    // makes referemce to the database
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func signupOrLogin(_ sender: UIButton) {
        print("################ HERE 1 ###############")
        
        // is either field is empty
        if email.text! == "" || password.text! == "" {
            
            let alert = UIAlertController(title: "Error in Form.", message: "Please enter an email and password.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                print("Okay pressed!")
            }))
            
            self.present(alert, animated: true)
            
        } else {
            print("################ HERE 2 ###############")
            // if email is valid and not in database
            // if emailIsValid(email.text!) && userNotInDataBase(email.text!) {
            
            // if user is signing up
            if (signUpModeActive) {
                print("################ HERE 3 ###############")
                
                self.ref.child(email.text!).setValue(["username": email.text])
                self.ref.child(password.text!).setValue(["password": password.text])
                
                email.text! = ""
                password.text! = ""
                
                
            } else {
                print("################ HERE 4 ###############")
                self.ref.root.child("users").child(email.text!)
                
                // only need to fetch once so use single event
                
                ref.observeSingleEvent(of: .value, with: { snapshot in
                    print("################ HERE 5 ###############")
                    if !snapshot.exists() { return }
                    print("################ HERE 6 ###############")
                    //self.sendSMS(text: "Hello from Swift!")
                    print("################ HERE 7 ###############")
                    // ANIMATE CONTINUE BUTTON
                    print("################ HERE 8 ###############")
                    UIView.animate(withDuration: 2.5, animations: {
                        print("################ HERE 9 ###############")
                        // what do you want the end result to be
                        self.signupOrLoginOutlet.alpha = 0
                        self.switchLoginModeOutlet.alpha = 0
                        self.haveAnAccountLabel.text = "Login Successful!"
                        self.continueOutlet.alpha = 1
                        print("################ HERE 10 ###############")
                    })
                })
            }
            //}
        }
    }
    
    @IBAction func switchLoginMode(_ sender: UIButton) {
        
        if (signUpModeActive) {
            
            signUpModeActive = false
            
            switchLoginModeOutlet.setTitle("SignUp", for: [])
            
            signupOrLoginOutlet.setTitle("Login", for: [])
            
            haveAnAccountLabel.text! = "Don't Have An Account Yet?"
            
            
        } else {
            
            signUpModeActive = true
            
            switchLoginModeOutlet.setTitle("Login", for: [])
            
            signupOrLoginOutlet.setTitle("SignUp", for: [])
            
            haveAnAccountLabel.text! = "Already Have An Account?"
        }
    }
    
    func emailIsValid(_ email: String) -> Bool {
        
        return true
    }
    
    func userNotInDataBase(_ email: String) -> Bool {
        
        
        
        ref.child(email).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            self.value = snapshot.value as? NSDictionary as! [String : AnyObject]
            self.username = self.value[email] as? String ?? "something went wrong"
            
        })
        
        print("username", self.username)
        print("email", self.email!)
        
        if username == "something went wrong" {
            
            print("email not found")
            return true
            
        } else {
            
            print("email found")
            return false
            
        }
    }
}


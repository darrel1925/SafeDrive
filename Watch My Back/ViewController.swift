//
//  ViewController.swift
//  Watch My Back
//
//  Created by Darrel Muonekwu on 1/12/19.
//  Copyright © 2019 Darrel Muonekwu. All rights reserved.
//

import UIKit


import Foundation
import Alamofire
import SmartcarAuth

class ViewController: UIViewController {
    
    var appDelegate : AppDelegate?
    var hasMoved = false
    var timer = Timer()
    var count = 0
    var timerCount = 0
    
    // for Twilio
    let ACCOUNT_SID = "AC1fb80057b60fd715959db31c6932e95a"
    let AUTH_TOKEN = "127998cc4d499505506d00ebaafda1de"
    lazy var URL = "https://api.twilio.com/2010-04-01/Accounts/\(ACCOUNT_SID)/Messages"
    let TWILIO_NUM = "16692019552"
    let PERSONAL_NUM = "19258488396"
    
    // for SmartCar
    let APP_SERVER = "https://api.smartcar.com/v1.0"
    let CLIENT_ID = "f2a715c7-c0d9-4263-8e00-0ffa305fa163"
    let CLIENT_SECRET = "dfb30faa-bf99-43b1-ae91-7d3085b25dae"
    lazy var REDIRECT_URI = "sc\(CLIENT_ID)://safedrive"
    
    
    @IBOutlet weak var detected: UILabel!
    @IBOutlet weak var warnHighbeamOutlet: UIButton!
    @IBOutlet weak var warnTailgateOutlet: UIButton!
    @IBOutlet weak var grabExteriorOutlet: UIButton!
    @IBOutlet weak var grabInteriorOutlet: UIButton!
    @IBOutlet weak var `continue`: UIButton!
    
    @IBOutlet var mainVIew: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate!.smartcarSdk = SmartcarAuth(clientId: CLIENT_ID, redirectUri: REDIRECT_URI, completion: completion)
        let smartcarSdk = appDelegate!.smartcarSdk
        
        // initialize authorization flow on the SFSafariViewController
        smartcarSdk!.launchAuthFlow(state: nil, forcePrompt: false, viewController: self)
        
        // TODO: Authorization Step 1: Initialize the Smartcar object
        appDelegate!.smartcarSdk = SmartcarAuth(
            clientId: CLIENT_ID,
            redirectUri: REDIRECT_URI,
            development: true,
            completion: completion
        )
        
        
        grabExteriorOutlet.alpha = 0
        grabInteriorOutlet.alpha = 0
        
        
        let myView = UITapGestureRecognizer(target: self, action: #selector(someAction(_:)))
        self.mainVIew.addGestureRecognizer(myView)
    }
    
    @objc func someAction(_ sender:UITapGestureRecognizer){
        // if the main view if clicked reset the buttons
        print("1")
        resetButtons()
        
    }
    
    @IBAction func warnHighbeam(_ sender: UIButton) {
        print("send a GET response for highbeams")
        
        if claimIsValid() {
            
            warnTailgateOutlet.alpha = 0
            UIView.animate(withDuration: 1, animations: {
                // what do you want the end result to be
                self.grabExteriorOutlet.center.x = self.warnTailgateOutlet.center.x
                self.grabExteriorOutlet.center.y = self.warnTailgateOutlet.center.y
                self.grabExteriorOutlet.alpha = 1
                self.grabExteriorOutlet.setTitleColor(#colorLiteral(red: 0.8291759201, green: 0.2669442437, blue: 0, alpha: 1), for: [])
                
                self.detected.alpha = 1
                self.detected.textColor = #colorLiteral(red: 0.37983042, green: 0.7361801267, blue: 0.08733794838, alpha: 1)
                self.detected.text = "High Beams Deteted!"
                
                if !self.hasMoved {
                    
                    self.detected.center.y = self.detected.center.y + 18
                    self.hasMoved = true
                    
                }
            })
            
        } else {
            
            UIView.animate(withDuration: 1, animations: {
                // what do you want the end result to be
                self.detected.alpha = 1
                self.detected.textColor = #colorLiteral(red: 0.8766438365, green: 0.02885242365, blue: 0.00317505328, alpha: 1)
                self.detected.text = "NO High Beams Detected!"
                
                if !self.hasMoved {
                    
                    self.detected.center.y = self.detected.center.y + 18
                    self.hasMoved = true
                    
                }
            })
        }
    }
    
    @IBAction func warnTailgate(_ sender: Any) {
        print("send a GET response for tailgates")
        
        if claimIsValid() {
            
            warnHighbeamOutlet.alpha = 0
            UIView.animate(withDuration: 1, animations: {
                // what do you want the end result to be
                self.grabInteriorOutlet.center.x = self.warnHighbeamOutlet.center.x
                self.grabInteriorOutlet.center.y = self.warnHighbeamOutlet.center.y
                self.grabInteriorOutlet.alpha = 1
                self.grabInteriorOutlet.setTitleColor(#colorLiteral(red: 0.8291759201, green: 0.2669442437, blue: 0, alpha: 1), for: [])
                
                self.detected.alpha = 1
                self.detected.textColor = #colorLiteral(red: 0.37983042, green: 0.7361801267, blue: 0.08733794838, alpha: 1)
                self.detected.text = "Tailgaiting Detected!"
                
                if !self.hasMoved {
                    
                    self.detected.center.y = self.detected.center.y - 18
                    self.hasMoved = true
                    
                }
                
            })
            
        } else {
            UIView.animate(withDuration: 1, animations: {
                // what do you want the end result to be
                self.detected.alpha = 1
                self.detected.textColor = #colorLiteral(red: 0.8766438365, green: 0.02885242365, blue: 0.00317505328, alpha: 1)
                self.detected.text = "Tailgaiting NOT Detected!"
                
                if !self.hasMoved {
                    
                    self.detected.center.y = self.detected.center.y + 18
                    self.hasMoved = true
                    
                }
            })
        }
    }
    @IBAction func grabInterior(_ sender: UIButton) {
        
        sendSMS(text: "Please slow down. You may be tailgating the car in front of you.")
        
        UIView.animate(withDuration: 1, animations: {
            // what do you want the end result to be
            self.continue.alpha = 1
            self.detected.text = "Vehicle Notified!"
        })
    }
    
    @IBAction func grabExterior(_ sender: Any) {
        
        UIView.animate(withDuration: 1, animations: {
            // what do you want the end result to be
            self.continue.alpha = 1
            self.detected.text = "Vehicle Notified!"
        })
        
        sendSMS(text: "Please turn off your high beams. You may be impairing the vision of other drivers.")
        
        
    }
    
    func resetButtons() {
        grabExteriorOutlet.alpha = 0
        grabInteriorOutlet.alpha = 0
        
        grabExteriorOutlet.center.y = grabExteriorOutlet.center.y + 18
        grabInteriorOutlet.center.y = grabInteriorOutlet.center.y - 18
        
        UIView.animate(withDuration: 0.75, animations: {
            // what do you want the end result to be
            self.warnHighbeamOutlet.alpha = 1
            self.warnTailgateOutlet.alpha = 1
            
            self.grabInteriorOutlet.setTitleColor(#colorLiteral(red: 0.8291759201, green: 0.2669442437, blue: 0, alpha: 1), for: [])
            self.grabExteriorOutlet.setTitleColor(#colorLiteral(red: 0.8291759201, green: 0.2669442437, blue: 0, alpha: 1), for: [])
            
            self.detected.alpha = 0
            self.detected.center.y = self.detected.center.y - 18
            
            self.hasMoved = false
            
        })
        
    }
    
    func sendSMS(text message : String) {
        
        let parameters = ["From": TWILIO_NUM, "To": PERSONAL_NUM, "Body": message]
        
        Alamofire.request(URL, method: .post, parameters: parameters)
            .authenticate(user: ACCOUNT_SID, password: AUTH_TOKEN)
            .responseJSON { response in
                debugPrint(response)
        }
        
        // RunLoop.main.run()
        
    }
    
    
    func claimIsValid() -> Bool {
        
        count += 1
        
        if count % 2 == 0 {
            
            return true
            
        } else {
            
            return false
            
        }
        /* if highBeamsOn == true {
         
         return true
         print("Check if highbeams are on")
         
         } else {
         
         return fasle
         }
         return true */
    }
    
    
    func completion(err: Error?, code: String?, state: String?) -> Any {
        // TODO: Authorization Step 3b: Receive the authorization code
        // TODO: Request Step 2: Get vehicle information
        
        // send request to exchange auth code for access token
        Alamofire.request("\(APP_SERVER)/exchange?code=\(code!)", method: .get).responseJSON {_ in
            
            
            // send request to retrieve the vehicle info
            Alamofire.request("\(self.APP_SERVER)/vehicles", method: .get).responseJSON { response in
                print(response.result.value!, "((((((((((+++++++++++++")
                
                if let result = response.result.value {
                    let JSON = result as! NSDictionary
                    print(JSON, "((((((((((+++++++++++++")
                    let make = JSON.object(forKey: "make")!  as! String
                    let model = JSON.object(forKey: "model")!  as! String
                    let year = String(JSON.object(forKey: "year")!  as! Int)
                    
                    let vehicle = "\(year) \(make) \(model)"
                    
                    print(vehicle)
                    print(JSON)
                    self.performSegue(withIdentifier: "displayVehicleInfo", sender: self)
                }
            }
        }
        return code!
    }
    
    
    // getting-started-ios-sdk/ViewController.swift
    
    // getting-started-ios-sdk/ViewController.swift
    
    @IBAction func connectPressed(_ sender: UIButton) {
        // TODO: Authorization Step 2: Launch the authorization flow
        let smartcar = appDelegate?.smartcarSdk!
        smartcar!.launchAuthFlow(viewController: self)
    }
}

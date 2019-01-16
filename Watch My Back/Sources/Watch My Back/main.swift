import Foundation
import Alamofire

    let accountSID = "AC1fb80057b60fd715959db31c6932e95a"
    let authToken = "127998cc4d499505506d00ebaafda1de"
    
    let url = "https://api.twilio.com/2010-04-01/Accounts/\(accountSID)/Messages"
    let parameters = ["From": "16692019552", "To": "19258488396", "Body": "Hello from Swift!"]
    
    Alamofire.request(url, method: .post, parameters: parameters)
        .authenticate(user: accountSID, password: authToken)
        .responseJSON { response in
            debugPrint(response)
    }
    
    RunLoop.main.run()



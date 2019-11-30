//
//  APIController.swift
//  issho-ios
//
//  Created by Isom Durm on 11/28/19.
//  Copyright © 2019 isom.tech. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Alamofire
import Alamofire_SwiftyJSON

protocol APIControllerProtocol : class {
    func didReceiveAPIResults(_ results: JSON, call: String)
}

class APIController {
    
    weak var delegate: APIControllerProtocol?
    
    let server: String = "http://192.168.10.135:5000"
    
    init(delegate: APIControllerProtocol) {
        self.delegate = delegate
    }
    
    func fetchMessages() {
        let url = URL(string: self.server + "/api/chats")!
        
        let parameters = Dictionary<String, Any>()
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default)
        .responseSwiftyJSON { dataResponse in
            self.delegate!.didReceiveAPIResults(dataResponse.value!, call: "fetchedMessages")
        }
    }
    
    func fetchTopHeadlines() {
        let url = URL(string: self.server + "/api/news/top-headlines")!
        
        let parameters = Dictionary<String, Any>()
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default)
        .responseSwiftyJSON { dataResponse in
            self.delegate!.didReceiveAPIResults(dataResponse.value!, call: "fetchedTopHeadlines")
        }
    }
    
    func authenticate(_ email: String, password: String) {
        let url = URL(string: self.server + "/api/users/signin")!
        
        let parameters: Dictionary<String, AnyObject> = ["email": email as AnyObject, "password": password as AnyObject]

        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default)
        .responseSwiftyJSON { dataResponse in
            print(dataResponse)
                // receiving "token": "Bearer ......"
                // use this for further api calls
            self.delegate!.didReceiveAPIResults(dataResponse.value!, call: "authenticated")
        }
    }
    
    func createUser(_ firstName: String, lastName: String, email: String, password: String, password2: String, phoneNumber: String) {
        let url = URL(string: self.server + "/api/users/register")!
        
        let parameters: Dictionary<String, AnyObject> = ["firstName": firstName as AnyObject, "lastName": lastName as AnyObject, "email": email as AnyObject, "password": password as AnyObject, "password2": password2 as AnyObject, "phoneNumber": phoneNumber as AnyObject]

        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default)
        .responseSwiftyJSON { dataResponse in
            print(dataResponse)
            
            self.delegate!.didReceiveAPIResults(dataResponse.value!, call: "createdUser")
        }
    }
    
    func verifyUser(_ pin: String, requestId: String) {
        let url = URL(string: self.server + "/api/users/verify")!
        
        let parameters: Dictionary<String, AnyObject> = ["pin": pin as AnyObject, "requestId": requestId as AnyObject]

        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default)
        .responseSwiftyJSON { dataResponse in
            print(dataResponse)
            
            self.delegate!.didReceiveAPIResults(dataResponse.value!, call: "verifiedUser")
        }
    }
    
}

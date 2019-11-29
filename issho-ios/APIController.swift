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
    
}

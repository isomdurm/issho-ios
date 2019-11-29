//
//  ViewController.swift
//  issho-ios
//
//  Created by Isom Durm on 11/28/19.
//  Copyright © 2019 isom.tech. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class ViewController: UIViewController, APIControllerProtocol {
    
    var api : APIController?
    
    var messages = [Message]()

    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.api = APIController(delegate: self)
        self.api?.fetchMessages()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func didReceiveAPIResults(_ results: JSON, call: String) {
        self.messages = Message.messagesWithJSON(results)
        print(messages)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


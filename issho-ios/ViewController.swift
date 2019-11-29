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
    var articles = [Article]()

    @IBOutlet weak var articleHeaderImage: UIImageView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.api = APIController(delegate: self)
        self.api?.fetchMessages()
        self.api?.fetchTopHeadlines()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func didReceiveAPIResults(_ results: JSON, call: String) {
        if call == "fetchedTopHeadlines" {
            self.articles = Article.articlesWithJSON(results)
        } else if call == "fetchedMessages" {
            self.messages = Message.messagesWithJSON(results)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


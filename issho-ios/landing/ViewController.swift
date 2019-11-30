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
//        self.api?.fetchMessages()
//        self.api?.fetchTopHeadlines()
//        self.api?.authenticate("isomdurm@gmail.com", password: "password")
//        self.api?.createUser("ish", lastName: "ish", email: "ish@gmail.com", password: "password", password2: "password", phoneNumber: "12124989360")
        self.api?.verifyUser("", requestId: "")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func didReceiveAPIResults(_ results: JSON, call: String) {
        if call == "fetchedTopHeadlines" {
            self.articles = Article.articlesWithJSON(results)
            
            let url = URL(string: self.articles[0].urlToImage)
            let data = try? Data(contentsOf: url!)
            self.articleHeaderImage.image = UIImage(data: data!)
            
        } else if call == "fetchedMessages" {
            self.messages = Message.messagesWithJSON(results)
        } else if call == "authenticated" {
            print("working")
        } else if call == "createdUser" {
            print("here")
            print(results)
        } else if call == "verifiedUser" {
            print(results)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


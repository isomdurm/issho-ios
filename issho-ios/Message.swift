//
//  Message.swift
//  issho-ios
//
//  Created by Isom Durm on 11/28/19.
//  Copyright © 2019 isom.tech. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Message {
    let id: String
    let name: String
    let color: String
    let emoji: String
    let users: Array<Any>
    let date: String
    
    init(id: String, name: String, color: String, emoji: String, users: Array<Any>, date: String) {
        self.id = id
        self.name = name
        self.color = color
        self.emoji = emoji
        self.users = users
        self.date = date
    }
    
    static func messagesWithJSON(_ results: JSON) -> [Message] {
        var messages = [Message]()

        for message in results.arrayValue {
            let id = message["_id"].string ?? ""
            let name = message["name"].string ?? ""
            let color = message["color"].string ?? ""
            let emoji = message["emoji"].string ?? ""
            let users = message["users"].arrayValue
            let date = message["date"].string ?? ""

            let msg = Message(id: id, name: name, color: color, emoji: emoji, users: users, date: date)

            messages.append(msg)
        }
        
        return messages
    }
}


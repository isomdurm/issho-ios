//
//  Article.swift
//  issho-ios
//
//  Created by Isom Durm on 11/29/19.
//  Copyright © 2019 isom.tech. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Article {
    let urlToImage: String
    let url: String
    let description: String
    let content: String
    let title: String
    let author: String
    let publishedAt: String
    
    init(urlToImage: String, url: String, description: String, content: String, title: String, author: String, publishedAt: String) {
        self.urlToImage = urlToImage
        self.url = url
        self.description = description
        self.content = content
        self.title = title
        self.author = author
        self.publishedAt = publishedAt
    }
    
    static func articlesWithJSON(_ results: JSON) -> [Article] {
        var articles = [Article]()

        for article in results.arrayValue {
            let urlToImage = article["urlToImage"].string ?? ""
            let url = article["url"].string ?? ""
            let description = article["description"].string ?? ""
            let content = article["content"].string ?? ""
            let title = article["title"].string ?? ""
            let author = article["author"].string ?? ""
            let publishedAt = article["publishedAt"].string ?? ""

            let artcle = Article(urlToImage: urlToImage, url: url, description: description, content: content, title: title, author: author, publishedAt: publishedAt)

            articles.append(artcle)
        }
        
        return articles
    }
}


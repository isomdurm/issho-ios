//
//  HomeViewController.swift
//  issho-ios
//
//  Created by Isom Durm on 11/29/19.
//  Copyright © 2019 isom.tech. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Kingfisher

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, APIControllerProtocol {
    
    var api : APIController?
    
    var articles = [Article]()
    
    @IBOutlet weak var articlesTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.api = APIController(delegate: self)
        self.api?.fetchTopHeadlines()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        articlesTableView.delegate = self
        articlesTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table View Variables
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell") as! ArticleCell
        let article = self.articles[indexPath.row]
       
        cell.articleSource.text = article.author
        cell.articleHeadline.text = article.description
       
        let url = URL(string: article.urlToImage)
        cell.articleHeaderImage.kf.setImage(with: url)
       
        return cell
    }
    
    func didReceiveAPIResults(_ results: JSON, call: String) {
        if call == "fetchedTopHeadlines" {
            self.articles = Article.articlesWithJSON(results)
            self.articlesTableView.reloadData()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


//
//  ArticleCell.swift
//  issho-ios
//
//  Created by Isom Durm on 11/29/19.
//  Copyright © 2019 isom.tech. All rights reserved.
//

import Foundation
import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var articleSource: UILabel!
    
    @IBOutlet weak var articleHeadline: UILabel!
    
    @IBOutlet weak var articleHeaderImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}


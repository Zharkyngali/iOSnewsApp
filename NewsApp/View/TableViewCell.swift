//
//  TableViewCell.swift
//  NewsApp
//
//  Created by Zharkyngali Savanbay on 07.02.2021.
//  Copyright © 2021 Zharkyngali Savanbay. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleOfContent: UILabel!
    @IBOutlet weak var contentText: UILabel!
    @IBOutlet weak var imageOfContent: UIImageView!
    
    var url: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func contentPressed(_ sender: UIButton) {
            if let url = URL(string: url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

//
//  ViewController.swift
//  NewsApp
//
//  Created by Zharkyngali Savanbay on 04.02.2021.
//  Copyright © 2021 Zharkyngali Savanbay. All rights reserved.
//

import UIKit
import SDWebImage
import SafariServices

class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var articles = [Articles]()
    let temp = NewsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: K.nibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        self.tableView.rowHeight = 200
        
        articles = temp.getData()
        tableView.reloadData()
    }
}


extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! TableViewCell
        let posts = articles[indexPath.row]
        cell.titleOfContent.text = posts.source.name ?? ""
        cell.contentText.text = posts.description ?? ""
        cell.imageOfContent.sd_setImage(with: URL(string: (posts.urlToImage ?? "")), placeholderImage: UIImage(named: "placeholder.png"))
        cell.url = posts.url ?? ""
        return cell
    }
    
    
}



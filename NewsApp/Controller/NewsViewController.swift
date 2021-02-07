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
    let newsURL = "https://newsapi.org/v2/top-headlines?country=us&apiKey=494799f7f38b47cd8a421329c2cb9925"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        tableView.dataSource = self
        
//        tableView.estimatedRowHeight = 414
        tableView.rowHeight = UITableView.automaticDimension
        self.tableView.rowHeight = 200
        
        if let url = URL(string: newsURL) {
            if let safeData = try? Data(contentsOf: url) {
                self.parseJSON(safeData: safeData)
            }
        }

    }
    
    @IBAction func contentPressed(_ sender: UIButton) {
    }
    func parseJSON(safeData: Data) {
        let decoder = JSONDecoder()
        if let decodeData = try? decoder.decode(NewsData.self, from: safeData) {
            articles = decodeData.articles
            tableView.reloadData()
        }
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



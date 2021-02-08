//
//  NewsManager.swift
//  NewsApp
//
//  Created by Zharkyngali Savanbay on 08.02.2021.
//  Copyright © 2021 Zharkyngali Savanbay. All rights reserved.
//

import Foundation

class NewsManager {
    
    let newsURL = "https://newsapi.org/v2/top-headlines?country=us&apiKey=494799f7f38b47cd8a421329c2cb9925"
    var newsData = [Articles]()
    
    func getData() -> [Articles] {
        if let url = URL(string: newsURL) {
            if let safeData = try? Data(contentsOf: url) {
                newsData = self.parseJSON(safeData: safeData)
            }
        }
        return newsData
    }
    
    func parseJSON(safeData: Data) -> [Articles] {
        var obtainedData = [Articles]()
        let decoder = JSONDecoder()
        if let decodeData = try? decoder.decode(NewsData.self, from: safeData) {
            obtainedData = decodeData.articles
        }
        return obtainedData
    }
}

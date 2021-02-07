//
//  NewsData.swift
//  NewsApp
//
//  Created by Zharkyngali Savanbay on 04.02.2021.
//  Copyright © 2021 Zharkyngali Savanbay. All rights reserved.
//

import Foundation

struct NewsData: Codable {
    var articles: [Articles]
}

struct Articles: Codable {
    var source: Source
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
}

struct Source: Codable {
    var id: String?
    var name: String?
}

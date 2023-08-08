//
//  main.swift
//  Crawling
//
//  Created by 조성민 on 2023/08/08.
//

import Foundation
import SwiftSoup


enum Errors: LocalizedError{
    case urlError
    
    var errorDescription: String? {
        switch self{
        case .urlError:
            return "urlError"
        }
    }
}

func crawling() throws {
    guard let url = URL(string: "http://board.sejong.ac.kr/boardlist.do?bbsConfigFK=335") else{ throw Errors.urlError }
    let html = try String(contentsOf: url, encoding: .utf8)
    let contents : Document = try SwiftSoup.parse(html)
    let lines = try contents.select("body > div.board-table.list > table > tbody > tr")
    for line in lines{
        try print(line.text())
    }
}

do {
    try crawling()
} catch{
    print(error.localizedDescription)
}

//
//  StatisticModel.swift
//  CryptoTracker
//
//  Created by FABRICIO ALVARENGA on 03/12/22.
//

import Foundation

struct StatisticModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
    
    static let example1 = StatisticModel(title: "Market Cap", value: "$12.58n", percentageChange: 25.34)
    static let example2 = StatisticModel(title: "Total Volue", value: "$1.23Tr")
    static let example3 = StatisticModel(title: "Portfolio Value", value: "$50.4k", percentageChange: -12.34)
}


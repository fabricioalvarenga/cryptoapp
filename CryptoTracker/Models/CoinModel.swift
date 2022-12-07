//
//  CoinModel.swift
//  CryptoTracker
//
//  Created by FABRICIO ALVARENGA on 23/11/22.
//

import Foundation

// CoinGecko API info
/*
 URL:
 https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 
 JSON Response:
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
     "current_price": 16422.71,
     "market_cap": 315563096369,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 344874793340,
     "total_volume": 25248159102,
     "high_24h": 16632.65,
     "low_24h": 16088.05,
     "price_change_24h": 221.86,
     "price_change_percentage_24h": 1.36941,
     "market_cap_change_24h": 4277294863,
     "market_cap_change_percentage_24h": 1.37407,
     "circulating_supply": 19215162,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 69045,
     "ath_change_percentage": -76.21455,
     "ath_date": "2021-11-10T14:24:11.849Z",
     "atl": 67.81,
     "atl_change_percentage": 24118.92257,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2022-11-23T16:41:05.394Z",
     "sparkline_in_7d": {
       "price": [
         16713.46263663692,
         16647.439245679256,
         16622.990094437577
       ]
     },
     "price_change_percentage_24h_in_currency": 1.3694066748601674
   }
 */

struct CoinModel: Identifiable, Codable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let currentPrice: Double
    let marketCap: Double?
    let marketCapRank: Double?
    let fullyDilutedValuation: Double?
    let totalVolume: Double?
    let high24H: Double?
    let low24H: Double?
    let priceChange24H: Double?
    let priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply: Double?
    let totalSupply: Double?
    let maxSupply: Double?
    let ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl: Double?
    let atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case symbol = "symbol"
        case name = "name"
        case image = "image"
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath = "ath"
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl = "atl"
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings = "currentHoldings"
    }
    
    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(
            id: id,
            symbol: symbol,
            name: name,
            image: image,
            currentPrice: currentPrice,
            marketCap: marketCap,
            marketCapRank: marketCapRank,
            fullyDilutedValuation: fullyDilutedValuation,
            totalVolume: totalVolume,
            high24H: high24H,
            low24H: low24H,
            priceChange24H: priceChange24H,
            priceChangePercentage24H: priceChangePercentage24H,
            marketCapChange24H: marketCapChange24H,
            marketCapChangePercentage24H: marketCapChangePercentage24H,
            circulatingSupply: circulatingSupply,
            totalSupply: totalSupply,
            maxSupply: maxSupply,
            ath: ath,
            athChangePercentage: athChangePercentage,
            athDate: athDate,
            atl: atl,
            atlChangePercentage: atlChangePercentage,
            atlDate: atlDate,
            lastUpdated: lastUpdated,
            sparklineIn7D: sparklineIn7D,
            priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency,
            currentHoldings: amount)
    }
    
    var currentHoldignsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
    
    static let example = CoinModel(id: UUID().uuidString, symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: 16422.71, marketCap: 315563096369.0, marketCapRank: 1.0, fullyDilutedValuation: 344874793340.0, totalVolume: 25248159102.0, high24H: 16632.65, low24H: 16088.05, priceChange24H: 221.86, priceChangePercentage24H: 1.36941, marketCapChange24H: 4277294863.0, marketCapChangePercentage24H: 1.37407, circulatingSupply: 19215162.0, totalSupply: 21000000.0, maxSupply: 21000000.0, ath: 69045.0, athChangePercentage: -76.21455, athDate: "2021-11-10T14:24:11.849Z", atl: 67.81, atlChangePercentage: 24118.92257, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2022-11-23T16:41:05.394Z", sparklineIn7D: SparklineIn7D(price: [16713.46263663692, 16647.439245679256, 16622.990094437577]), priceChangePercentage24HInCurrency: 1.3694066748601674, currentHoldings: 1.5)
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}


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
    
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
    
    static let example = CoinModel(id: UUID().uuidString, symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: 16422.71, marketCap: 315563096369.0, marketCapRank: 1.0, fullyDilutedValuation: 344874793340.0, totalVolume: 25248159102.0, high24H: 16632.65, low24H: 16088.05, priceChange24H: 221.86, priceChangePercentage24H: 1.36941, marketCapChange24H: 4277294863.0, marketCapChangePercentage24H: 1.37407, circulatingSupply: 19215162.0, totalSupply: 21000000.0, maxSupply: 21000000.0, ath: 69045.0, athChangePercentage: -76.21455, athDate: "2021-11-10T14:24:11.849Z", atl: 67.81, atlChangePercentage: 24118.92257, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2022-11-23T16:41:05.394Z", sparklineIn7D: SparklineIn7D(price: [20738.586235636016, 20916.015790269255, 20925.89867644994, 20843.138978816634, 20782.577828131904, 20810.253612457294, 20743.696201708284, 20754.500109660865, 20805.99656754562, 20847.535518328263, 20879.331766942843, 20944.01926345526, 20922.63683936556, 20787.842893640514, 20766.851778303942, 20742.57280368986, 20726.2069338249, 20729.361218053786, 20752.918153190985, 20737.959658386164, 20732.608355807854, 20606.5461758432, 20674.634038731267, 20731.63255622184, 20733.65671731066, 20696.454282735875, 20747.94871301318, 20814.711437098063, 20956.258670269104, 20885.701278781053, 20889.403819883028, 20700.805744941004, 20901.09559081564, 20920.837333244166, 20903.899112009953, 20812.144521910206, 20906.040141869526, 20924.7111951552, 21190.077883095764, 21252.80928594751, 21026.965195103217, 21182.34866601395, 21224.083398217746, 21185.648911080865, 21072.65359224, 20751.537690394238, 20848.124708243373, 20828.207191874055, 20830.174346566208, 20802.81790553102, 20834.072135270028, 20859.10770712413, 20991.5669252237, 20981.752724442926, 21100.504618517323, 21218.833092977453, 21339.084564658813, 21291.821112503225, 21140.66776867305, 21196.7043539542, 21167.444996055972, 21087.189102768214, 21035.72416889137, 21091.322083737952, 21172.113197961044, 21163.030385333517, 21145.6834326599, 21078.016212611372, 21143.37185759893, 21201.941740865605, 21176.316447906156, 21147.625909358103, 21194.878269385026, 21260.553260427037, 21225.208422953252, 21167.102796860785, 21138.35118965325, 21240.172245106583, 21198.319122314566, 21356.44102222878, 21338.670970458825, 21326.41137103781, 21320.63011839789, 21247.502058233295, 21133.228554777954, 21210.654453673727, 21228.94986922072, 21316.610964520347, 21300.16714992632, 21273.860887323823, 21291.29088890238, 21267.62240006751, 21311.80322871148, 21236.33404462805, 21230.590444690875, 21176.790798372233, 21213.180310576274, 21272.503908492723, 21434.158598677062, 21470.68464261412, 21255.367139697784, 20532.907207838653, 20934.37579434191, 20937.39396072067, 20910.1451870655, 20694.121613021045, 20792.951370835992, 20831.950823406285, 20721.040207375805, 20699.21555980322, 20703.005937204824, 20756.20479654092, 20760.651852365685, 20804.53758389287, 20812.424364733422, 20848.790124063587, 20832.22709301364, 20793.46276269477, 20807.582649363158, 20799.08306475155, 20748.392092374652, 20719.48660369809, 20786.970374848017, 20860.104147415946, 20882.18578572461, 20877.126652014747, 20852.259373693443, 20960.404359282198, 21090.266589122053, 21099.939720759114, 20935.470397262245, 21080.253855652136, 21089.76082019566, 21063.265412777684, 21137.19112365942, 21114.59209740846, 21080.430488055168, 20985.10026162292, 20990.0990425081, 20974.655186764052, 20960.595624526584, 20950.34484965064, 20977.63903379022, 20955.5008649984, 20978.796922919933, 21098.24954564038, 21099.171128196944, 21063.796423891363, 21155.590480119536, 21313.044810377636, 21353.08278356443, 21392.550651971153, 21444.736578549597, 22177.5639031667, 22327.516532856698, 22621.80907133512, 22705.83367889906, 22610.911113497386, 22571.964470380102, 22565.320045768174, 22548.070087429172, 22607.09241933134, 22579.785588447427, 22615.674556712373, 22660.11660938527, 22710.07984828147, 23018.961631182327, 22674.714410981822]), priceChangePercentage24HInCurrency: 1.3694066748601674, currentHoldings: 1.5)
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}


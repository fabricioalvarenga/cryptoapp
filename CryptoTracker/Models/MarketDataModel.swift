//
//  MarketDataModel.swift
//  CryptoTracker
//
//  Created by FABRICIO ALVARENGA on 04/12/22.
//

import Foundation

// CoinGecko API info
/*
 URL:
 https://api.coingecko.com/api/v3/global
 
 JSON Response:
 {
   "data": {
     "active_cryptocurrencies": 13097,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 610,
     "total_market_cap": {
       "btc": 52310056.28783776,
       "eth": 706482967.4291291,
       "ltc": 11649706372.018835,
       "bch": 8034016281.964561,
       "bnb": 3063879769.74784,
       "eos": 961742790245.7421,
       "xrp": 2271348072973.7686,
       "xlm": 10211691846603.412,
       "link": 121062040683.55493,
       "dot": 160640801583.33527,
       "yfi": 130589650.58644004,
       "usd": 889995071711.7621,
       "aed": 3268951898397.2974,
       "ars": 149611108538483.28,
       "aud": 1309586808250.5554,
       "bdt": 91180413394553.36,
       "bhd": 335642951399.5842,
       "bmd": 889995071711.7621,
       "brl": 4645329276799.534,
       "cad": 1201092849028.6077,
       "chf": 832977537442.5476,
       "clp": 786310645857340.5,
       "cny": 6251948380253.612,
       "czk": 20573838073746.445,
       "dkk": 6278559232897.786,
       "eur": 844598203093.8859,
       "gbp": 723573113262.2324,
       "hkd": 6933284107402.555,
       "huf": 346154683191571.8,
       "idr": 13685721216233224,
       "ils": 3025603215924.3633,
       "inr": 72464778231132.42,
       "jpy": 119539685440379.72,
       "krw": 1157807938715904.2,
       "kwd": 272864479031.1802,
       "lkr": 327964923866148.6,
       "mmk": 1868999224271685.2,
       "mxn": 17258339433098.605,
       "myr": 3904853377135.347,
       "ngn": 394714432315206.1,
       "nok": 8690356877729.468,
       "nzd": 1387582416355.088,
       "php": 49603870871879.62,
       "pkr": 199649006866965.06,
       "pln": 3948952632938.6655,
       "rub": 55624683082034.34,
       "sar": 3345534194327.9478,
       "sek": 9190267109509.957,
       "sgd": 1203525205559.5952,
       "thb": 30902149001414.78,
       "try": 16584080056764.852,
       "twd": 27191930426502.246,
       "uah": 32703001519314.336,
       "vef": 89115206530.49873,
       "vnd": 21682504934577740,
       "zar": 15606317231061.174,
       "xdr": 673820608763.4017,
       "xag": 38494663138.37512,
       "xau": 495006358.9353638,
       "bits": 52310056287837.76,
       "sats": 5231005628783776
     },
     "total_volume": {
       "btc": 2072899.2688381744,
       "eth": 27995917.62188485,
       "ltc": 461644844.881421,
       "bch": 318365294.5254116,
       "bnb": 121412871.35252088,
       "eos": 38111140919.844536,
       "xrp": 90007086473.71518,
       "xlm": 404660404988.8308,
       "link": 4797345547.405668,
       "dot": 6365739664.193318,
       "yfi": 5174897.723851285,
       "usd": 35267982188.155815,
       "aed": 129539298577.09613,
       "ars": 5928664190170.191,
       "aud": 51895213462.690475,
       "bdt": 3613221351128.1772,
       "bhd": 13300578854.63698,
       "bmd": 35267982188.155815,
       "brl": 184081233031.07895,
       "cad": 47595905362.02565,
       "chf": 33008538909.2716,
       "clp": 31159262263235.613,
       "cny": 247746994477.13806,
       "czk": 815282890647.1597,
       "dkk": 248801507144.5636,
       "eur": 33469032952.70226,
       "gbp": 28673151662.828033,
       "hkd": 274746398241.28085,
       "huf": 13717128992261.285,
       "idr": 542326342501926.25,
       "ils": 119896080011.33516,
       "inr": 2871573775132.022,
       "jpy": 4737018923914.277,
       "krw": 45880647048304.62,
       "kwd": 10812845927.048855,
       "lkr": 12996320385240.56,
       "mmk": 74063141972811.55,
       "mxn": 683899076601.6223,
       "myr": 154738271850.5333,
       "ngn": 15641414217638.693,
       "nok": 344374212076.24615,
       "nzd": 54985958349.73172,
       "php": 1965660810916.95,
       "pkr": 7911524279032.775,
       "pln": 156485800367.95642,
       "rub": 2204248534079.914,
       "sar": 132574037908.42244,
       "sek": 364184237671.333,
       "sgd": 47692292757.34585,
       "thb": 1224564579286.3442,
       "try": 657180088563.8579,
       "twd": 1077539132996.5039,
       "uah": 1295927260433.1296,
       "vef": 3531383056.5000415,
       "vnd": 859216216058943.5,
       "zar": 618434119044.2354,
       "xdr": 26701600922.545757,
       "xag": 1525434395.150179,
       "xau": 19615699.01323034,
       "bits": 2072899268838.1743,
       "sats": 207289926883817.44
     },
     "market_cap_percentage": {
       "btc": 36.75016309334319,
       "eth": 17.055806360673547,
       "usdt": 7.364441626113888,
       "bnb": 5.328236722831662,
       "usdc": 4.871146241164729,
       "busd": 2.49050718172801,
       "xrp": 2.2126527652130545,
       "doge": 1.6082778840776728,
       "ada": 1.264567551583008,
       "matic": 0.9084135693860351
     },
     "market_cap_change_percentage_24h_usd": -0.08983864274904957,
     "updated_at": 1670152508
   }
 }
 */

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let activeCryptocurrencies: Int
    let upcomingIcos: Int
    let ongoingIcos: Int
    let endedIcos: Int
    let markets: Int
    let totalMarketCap: [String: Double]
    let totalVolume: [String: Double]
    let marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    let updatedAt: Int
    
    enum CodingKeys: String, CodingKey {
        case activeCryptocurrencies = "active_cryptocurrencies"
        case upcomingIcos = "upcoming_icos"
        case ongoingIcos = "ongoing_icos"
        case endedIcos = "ended_icos"
        case markets = "markets"
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
        case updatedAt = "updated_at"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
        
        return ""
    }
}

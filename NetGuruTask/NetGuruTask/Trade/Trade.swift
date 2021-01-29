// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let trade = try? newJSONDecoder().decode(Trade.self, from: jsonData)

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - Trade
struct Trade: Codable, Hashable {
    let data: DataClass?
    let event, channel: String?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - DataClass
struct DataClass: Codable, Hashable {
    let buyOrderid: Int?
    let amountStr, timestamp, microtimestamp: String?
    let id: Int?
    let amount: Double?
    let sellOrderid: Int?
    let priceStr: String?
    let type: Int?
    let price: Double?

    enum CodingKeys: String, CodingKey {
        case buyOrderid = "buy_order_id"
        case amountStr = "amount_str"
        case timestamp, microtimestamp, id, amount
        case sellOrderid = "sell_order_id"
        case priceStr = "price_str"
        case type, price
    }
}

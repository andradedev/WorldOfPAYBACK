//
//  TransactionModel.swift
//  WorldOfPAYBACK
//
//  Created by Felipe Andrade on 25/03/23.
//

import Foundation

struct TransactionResponseModel: Decodable {
    var items: [TransactionModel]
    
    func sorted() -> [TransactionModel] {
        return items.sorted(by: { $0.getDate() > $1.getDate() })
    }
}

struct TransactionModel: Decodable, Identifiable {
    var partnerDisplayName: String
    var transactionDetail: TransactionDetail
    var category: Int
    var alias: TransactionAlias
    
    var id: String {
        alias.reference
    }
    
    func getDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss+SSS"
        let date = dateFormatter.date(from: transactionDetail.bookingDate)
        return date ?? Date()
    }
    
    func getDateTime() -> String {
        return getDate().formatted(date: .numeric, time: .omitted)
    }
    
    func getHourTime() -> String {
        return getDate().formatted(date: .omitted, time: .standard)
    }
}

struct TransactionAlias: Decodable {
    var reference: String
}

struct TransactionDetail: Decodable {
    var description: String?
    var bookingDate: String
    var value: TransactionValue
}

struct TransactionValue: Decodable {
    var amount: Int
    var currency: String
}

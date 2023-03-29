//
//  TransactionService.swift
//  WorldOfPAYBACK
//
//  Created by Felipe Andrade on 25/03/23.
//

import Combine
import Foundation

class TransactionService {
    func getDataModel() -> TransactionResponseModel? {
        if let path = Bundle.main.path(forResource: "PBTransactions", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                switch Int.random(in: 0..<3) {
                case 0:
                    return nil
                default:
                    return try JSONDecoder().decode(TransactionResponseModel.self, from: data)
                }
            } catch {
                return nil
            }
        }
        return nil
    }
}

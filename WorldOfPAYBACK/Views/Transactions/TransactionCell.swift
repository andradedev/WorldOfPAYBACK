//
//  TransactionCell.swift
//  WorldOfPAYBACK
//
//  Created by Felipe Andrade on 26/03/23.
//

import SwiftUI
import PBCore

struct TransactionCell: View {
    let model: TransactionModel
    
    var body: some View {
        HStack {
            VStack {
                Text(model.partnerDisplayName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 8)
                    .font(.title3)
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                Text(model.transactionDetail.description ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.gray)
                    .padding(.leading, 8)
                    .font(.caption)
            }.padding(4)
            VStack {
                Text("\(model.transactionDetail.value.amount) \(model.transactionDetail.value.currency)")
                    .frame(maxWidth: 110, alignment: .trailing)
                    .padding(.trailing, 8)
                    .foregroundColor(.green)
                    .lineLimit(1)
                    .font(.title3)
                Text(model.getDateTime())
                    .padding(.trailing, 8)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .frame(maxWidth: 110, alignment: .trailing)
                    .font(.caption)
                
            }.padding(4)
        }.padding(4)
            .background(UIColor.darkBluePBtransparent.color)
            .cornerRadius(16)
    }
}

struct TransactionCell_Previews: PreviewProvider {
    static var previews: some View {
        TransactionCell(model: .init(
            partnerDisplayName: "Company Name Company",
            transactionDetail: .init(
                description: "value descriotion",
                bookingDate: "20/03",
                value: .init(amount: 10000, currency: "AUD")),
            category: 1,
            alias: .init(reference: "")))
    }
}

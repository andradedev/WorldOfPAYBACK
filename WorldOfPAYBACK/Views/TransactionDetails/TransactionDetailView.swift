//
//  TransactionDetailView.swift
//  WorldOfPAYBACK
//
//  Created by Felipe Andrade on 26/03/23.
//

import SwiftUI

struct TransactionDetailView: View {
    var model: TransactionModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    Spacer().frame(maxHeight: 30)
                    Text(model.partnerDisplayName)
                        .font(.title2)
                    Spacer().frame(maxHeight: 20)
                    Text(model.transactionDetail.description ?? "")
                        .foregroundColor(UIColor.systemGray.color)
                    Spacer()
                }
                Spacer()
            }.background(.white)
        }.background(UIColor.darkBluePB.color)
            .navigationTitle("Details")
        
    }
}

struct TransactionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetailView(
            model: .init(
                partnerDisplayName: "Name",
                transactionDetail: .init(
                    description: "Test",
                    bookingDate: "",
                    value: .init(
                        amount: 0,
                        currency: ""
                    )
                ),
                category: 0,
                alias: .init(reference: "")
            )
        )
    }
}

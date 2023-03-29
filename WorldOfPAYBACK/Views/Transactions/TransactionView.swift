//
//  TransactionView.swift
//  WorldOfPAYBACK
//
//  Created by Felipe Andrade on 25/03/23.
//

import SwiftUI

struct TransactionView: View {
    @ObservedObject var viewModel: TransactionsListViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Categories: ")
                    .frame(width: 85, height: 50, alignment: .leading)
                    .padding(.leading, 16)
                    .font(.subheadline)
                // it wasnt clear on the json how the filter would work so this was a trivial way with only 3 possibilities
                Button("Fisrt") {
                    viewModel.filterSelectedData = 1
                }.frame(maxWidth: .infinity)
                Button("Second") {
                    viewModel.filterSelectedData = 2
                }.frame(maxWidth: .infinity)
                Button("Third") {
                    viewModel.filterSelectedData = 3
                }.frame(maxWidth: .infinity)
                Button("All") {
                    viewModel.filterSelectedData = 0
                }.frame(maxWidth: .infinity)
            }
            List {
                if viewModel.model.isEmpty {
                    Text("↑ Pull to refresh ↑")
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, minHeight: 50, alignment: .center)
                        .listRowSeparator(.hidden)
                } else {
                    ForEach(viewModel.model) { item in
                        TransactionCell(model: item)
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                viewModel.didSelectItem(model: item)
                            }
                    }
                }
            }.refreshable {
                viewModel.getTransactionsData()
            }.listStyle(.plain)
            HStack {
                Text("Sum of transactions:")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("\(viewModel.sumValue.amount) \(viewModel.sumValue.currency)")
                    .foregroundColor(.white)
            }.padding()
                .background(UIColor.darkBluePB.color)
                
        }.navigationTitle("Transactions")
            //.background(UIColor.darkBluePB.withAlphaComponent(0.4).color)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        Self.setupView()
    }
    
    static func setupView() -> some View {
        let view = TransactionView(viewModel: TransactionsListViewModel())
        return view
    }
}

//
//  TransactionDetailViewController.swift
//  WorldOfPAYBACK
//
//  Created by Felipe Andrade on 26/03/23.
//

import Foundation
import PBCore

class TransactionDetailViewController: BaseSwiftUIViewController<TransactionDetailView> {
    
    init(model: TransactionModel) {
        super.init(view: .init(model: model))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
    }
}

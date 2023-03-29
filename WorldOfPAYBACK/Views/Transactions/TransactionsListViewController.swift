//
//  TransactionsListViewController.swift
//  WorldOfPAYBACK
//
//  Created by Felipe Andrade on 25/03/23.
//

import UIKit
import Combine

class TransactionsListViewController: BaseSwiftUIViewController<TransactionView> {
    var viewModel: TransactionsListViewModel
    
    init(viewModel: TransactionsListViewModel) {
        self.viewModel = viewModel
        super.init(view: .init(viewModel: viewModel))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .always
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if viewModel.cancellable.isEmpty {
            setupPipes()
            viewModel.setListeners()
        }
    }
    
    func setupPipes() {
        // Loading Pipe
        viewModel.dataEvents.sink { [weak self] dataEvent in
            switch dataEvent {
            case .loaded:
                self?.setLoading(false)
            case .shouldLoad:
                self?.setLoading(true)
            case .error:
                self?.setLoading(false)
                print("Error")
            }
        }.store(in: &viewModel.cancellable)
    }
}

//
//  TransactionsListViewModel.swift
//  WorldOfPAYBACK
//
//  Created by Felipe Andrade on 25/03/23.
//

import Combine
import Foundation
import PBCore

protocol TransactionsListRouteDelegate: AnyObject {
    func didSelectTransaction(_ model: TransactionModel)
    func didGetError(_ error: PBError)
}

class TransactionsListViewModel: ObservableObject {
    enum DataEvents {
        case loaded
        case shouldLoad
        case error
    }
    
    var delegate: TransactionsListRouteDelegate?
    
    var filter: CurrentValueSubject = CurrentValueSubject<Int, Never>(0)
    var data = CurrentValueSubject<TransactionResponseModel, Never>(.init(items: []))
    
    var dataEvents = PassthroughSubject<DataEvents, Never>()
    
    var cancellable: [AnyCancellable] = []
    
    @Published var model: [TransactionModel] = []
    @Published var sumValue: TransactionValue = .init(amount: 0, currency: "")
    
    var filterSelectedData: Int = 0 {
        didSet {
            filter.send(Int(filterSelectedData))
        }
    }
    
    func setListeners() {
        getTransactionsData()
        setScreenDataPipeline()
    }
    
    func setScreenDataPipeline() {
        // filter pipe
        data.combineLatest(filter).map({ streams in
            streams.0.sorted().filter({ $0.category == streams.1 || streams.1 <= 0 }) })
        .debounce(for: 0.1, scheduler: RunLoop.main)
        .sink { [weak self] model in
            self?.model = model
            
            self?.sumValue = .init(amount: model.map({ $0.transactionDetail.value.amount }).reduce(0, +),
                                  currency: model.first?.transactionDetail.value.currency ?? "")
        }.store(in: &self.cancellable)
    }
    
    func getTransactionsData() {
        // fetch data
        self.dataEvents.send(.shouldLoad)
        fetchTransactions()
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.data.send(.init(items: []))
                    self?.dataEvents.send(.error)
                    self?.delegate?.didGetError(error)
                case .finished:
                    self?.dataEvents.send(.loaded)
                }
            } receiveValue: { [weak self] model in
                self?.data.send(model)
            }.store(in: &cancellable)
    }
    
    func didSelectItem(model: TransactionModel) {
        delegate?.didSelectTransaction(model)
    }
    
    private func fetchTransactions() -> Future<TransactionResponseModel, PBError> {
        return Future() { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if let data = TransactionService().getDataModel() {
                    promise(.success(data))
                } else {
                    promise(.failure(PBError.unknown))
                }
            }
        }
    }
}

//
//  AppCoordinator.swift
//  WorldOfPAYBACK
//
//  Created by Felipe Andrade on 25/03/23.
//

import UIKit

class AppCoordinator {
    
    var window: UIWindow
    var navigation: UINavigationController?
    
    init(_ window: UIWindow) {
        self.window = window
        window.backgroundColor = .lightBluePB
        let rootView = getViewController()
        self.navigation = UINavigationController(rootViewController: rootView)
        configNavigation()
    }
    
    func configNavigation() {
        navigation?.navigationBar.tintColor = .black
        navigation?.navigationBar.prefersLargeTitles = true
        navigation?.navigationBar.backgroundColor = .clear
        navigation?.navigationBar.isTranslucent = false
        navigation?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
    }
    
    func start() {
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }
    
    func getViewController() -> UIViewController {
        let viewModel = TransactionsListViewModel()
        viewModel.delegate = self
        let view = TransactionsListViewController(viewModel: viewModel)
        return view
    }
    
    func getErrorView(error: PBError) -> UIViewController {
        let view = ErrorViewController(error: error)
        return view
    }
    
    func getTransactionDetailsView(model: TransactionModel) -> UIViewController {
        let view = TransactionDetailViewController(model: model)
        return view
    }
}

extension AppCoordinator: TransactionsListRouteDelegate {
    func didSelectTransaction(_ model: TransactionModel) {
        navigation?.pushViewController(getTransactionDetailsView(model: model), animated: true)
    }
    
    func didGetError(_ error: PBError) {
        navigation?.pushViewController(getErrorView(error: error), animated: true)
    }
}

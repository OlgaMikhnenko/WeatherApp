//  
//  MainViewController.swift
//  Weather
//
//  Created by Helga on 01.12.22.
//

import UIKit

final class MainViewController: UIViewController, MainViewControllerProtocol {
    
    let interactor: MainInteractorProtocol
    private let contentView = MainView()
    
    init(interactor: MainInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.execute(.getCurrentWeather)
    }
    
    func apply(_ state: MainDataFlow.State) {
        DispatchQueue.main.async { [weak self] in
            self?.applyState(state)
        }
    }
    
    private func applyState(_ state: MainDataFlow.State) {
        switch state {
        case let .success(success):
            handleSuccess(success)
            
        case let .failure(error):
            handleError(error)
        }
    }
    
    private func handleSuccess(_ state: MainDataFlow.Success) {
        switch state {
        case .updateMainView(let viewModel):
            contentView.configure(with: viewModel)
        }
    }
    
    private func handleError(_ error: MainDataFlow.Errors) {
        switch error {
        default:
            break
        }
    }
}

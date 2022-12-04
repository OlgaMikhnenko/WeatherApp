//  
//  MainViewController.swift
//  Weather
//
//  Created by Helga on 01.12.22.
//

import UIKit

final class MainViewController: UIViewController, MainViewControllerProtocol {
    private enum Constants {
        static let timerValue = 10.0
    }
    
    let interactor: MainInteractorProtocol
    private let contentView = MainView()
    private let hoursDataSource = HourForecastCollectionDataSource()
    private let daysDataSource = DayForecastCollectionDataSource()
    private var timer = Timer()
    
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
        contentView.hoursForecastCollectionView.dataSource = hoursDataSource
        contentView.hoursForecastCollectionView.delegate = hoursDataSource
        contentView.daysForecastTableView.dataSource = daysDataSource
        contentView.daysForecastTableView.delegate = daysDataSource
        interactor.execute(.getCurrentWeather)
        interactor.execute(.getForecast)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.execute(.getCurrentWeather)
        interactor.execute(.getForecast)
        setUpTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
            
        case .updateHoursForecast(let viewModels):
            hoursDataSource.viewModels = viewModels
            contentView.hoursForecastCollectionView.reloadData()
            
        case .updateDaysForecast(let viewModels):
            daysDataSource.viewModels = viewModels
            contentView.daysForecastTableView.reloadData()
        }
    }
    
    private func handleError(_ error: MainDataFlow.Errors) {
        switch error {
        default:
            break
        }
    }
    
    private func setUpTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: Constants.timerValue,
            target: self,
            selector: #selector(timerEvent),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc
    func timerEvent() {
        interactor.execute(.getCurrentWeather)
        interactor.execute(.getForecast)
    }
}

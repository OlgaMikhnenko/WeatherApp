//  
//  MainBuilder.swift
//  Weather
//
//  Created by Helga on 01.12.22.
//

import UIKit

final class MainBuilder {
    func build() -> UIViewController {
        let presenter = MainPresenter()
        let interactor = MainInteractor(presenter: presenter)
        let controller = MainViewController(interactor: interactor)
        presenter.controller = controller
        
        return controller
    }
}

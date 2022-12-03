//  
//  MainViewControllerProtocol.swift
//  Weather
//
//  Created by Helga on 01.12.22.
//

protocol MainViewControllerProtocol: AnyObject {
    func apply(_ state: MainDataFlow.State)
}

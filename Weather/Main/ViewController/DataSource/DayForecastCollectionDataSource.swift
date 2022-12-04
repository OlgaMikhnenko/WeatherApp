//
//  DayForecastCollectionDataSource.swift
//  Weather
//
//  Created by Helga on 03.12.22.
//

import UIKit
import UIComponents

final class DayForecastCollectionDataSource: NSObject {
    var viewModels: [CellRepresentable] = []
}

extension DayForecastCollectionDataSource: UITableViewDelegate, UITableViewDataSource {
    private enum Constants: Grid {
        static let cellHeight: CGFloat = 60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: DayForecastCell.ViewModel.reuseIdentifier,
                for: indexPath
            ) as? DayForecastCell,
            let viewModel = viewModels[safe: indexPath.row] as? DayForecastCell.ViewModel
        else {
            return UITableViewCell()
        }
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.cellHeight
    }
    
}


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

extension DayForecastCollectionDataSource: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: DayForecastCell.ViewModel.reuseIdentifier,
                for: indexPath
            ) as? DayForecastCell,
            let viewModel = viewModels[safe: indexPath.row] as? DayForecastCell.ViewModel
        else {
            return UICollectionViewCell()
        }
        cell.configure(with: viewModel)
        return cell
    }
    
}


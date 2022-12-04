//
//  HourForecastCollectionDataSource.swift
//  Weather
//
//  Created by Helga on 03.12.22.
//

import UIKit
import UIComponents

final class HourForecastCollectionDataSource: NSObject {
    var viewModels: [CellRepresentable] = []
}

extension HourForecastCollectionDataSource: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HourForecastCell.ViewModel.reuseIdentifier,
                for: indexPath
            ) as? HourForecastCell,
            let viewModel = viewModels[safe: indexPath.row] as? HourForecastCell.ViewModel
        else {
            return UICollectionViewCell()
        }
        cell.configure(with: viewModel)
        return cell
    }
    
}

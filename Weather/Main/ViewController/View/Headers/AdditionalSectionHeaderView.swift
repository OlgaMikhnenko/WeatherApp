//
//  AdditionalSectionHeaderView.swift
//  Weather
//
//  Created by Helga on 04.12.22.
//

import UIKit
import UIComponents

extension AdditionalSectionHeaderView {
    struct ViewModel {
        let image: UIImage
        let text: String
    }
}

final class AdditionalSectionHeaderView: UIView {
    private enum Constants: Grid { }
    static let identifier = "AdditionalSectionHeaderView"
    
    private let headerIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = Colors.Inverse.inverseA01
        return imageView
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel(withShadow: true)
        label.textColor = Colors.Inverse.inverseA01
        label.font = Fonts.displayXS500
        label.text = AppStrings.SunMovementComponent.header.get().uppercased()
        return label
    }()
    
    func configure(
        image: UIImage?,
        text: String?
    ) {
        headerIcon.image = image
        headerLabel.text = text?.uppercased()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLayout() {
        backgroundColor = .clear
        [
            headerIcon,
            headerLabel
        ].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            headerIcon.topAnchor.constraint(equalTo: topAnchor, constant: Constants.xsSpace),
            headerIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.mSpace),
            headerIcon.widthAnchor.constraint(equalToConstant: Constants.sSize.width),
            headerIcon.heightAnchor.constraint(equalToConstant: Constants.mSize.height),
            
            headerLabel.centerYAnchor.constraint(equalTo: headerIcon.centerYAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: headerIcon.trailingAnchor, constant: Constants.xsSpace),
        ])
        
    }
}

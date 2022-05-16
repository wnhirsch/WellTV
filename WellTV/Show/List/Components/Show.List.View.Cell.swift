//
//  Show.List.View.Cell.swift
//  WellTV
//
//  Created by Wellington Nascente Hirsch on 16/05/22.
//

import UIKit
import SnapKit

extension Scene.Show.List {
    
    class Cell: UITableViewCell, CodeView {
        
        private let posterImageView = UIImageView(image: UIImage.posterPlaceholder)
        
        private let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            return stackView
        }()
        
        private let titleLabel = UILabel()
        
        private let genresLabel: UILabel = {
            let label = UILabel()
            label.textColor = .secondaryLabel
            return label
        }()
        
        private let ratingStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 4
            stackView.alignment = .center
            return stackView
        }()
        
        private let ratingImageView: UIImageView = {
            let imageView = UIImageView(image: UIImage.starFill)
            imageView.tintColor = .yellow
            return imageView
        }()
        
        private let ratingLabel: UILabel = {
            let label = UILabel()
            label.textColor = .secondaryLabel
            return label
        }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupView()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func buildViewHierarchy() {
            addSubview(posterImageView)
            addSubview(stackView)
            
            stackView.addArrangedSubview(titleLabel)
            stackView.addArrangedSubview(genresLabel)
            stackView.addArrangedSubview(ratingStackView)
            
            ratingStackView.addArrangedSubview(ratingImageView)
            ratingStackView.addArrangedSubview(ratingLabel)
        }
        
        func setupConstraints() {
            posterImageView.snp.makeConstraints{ (make) -> Void in
                make.leading.equalToSuperview().offset(16)
                make.top.equalToSuperview().offset(8)
                make.bottom.lessThanOrEqualToSuperview().inset(8)
                make.height.equalTo(60)
                make.width.equalTo(40)
            }
            
            stackView.snp.makeConstraints{ (make) -> Void in
                make.top.equalTo(posterImageView.snp.top)
                make.leading.equalTo(posterImageView.snp.trailing).offset(8)
                make.trailing.equalToSuperview().inset(16)
                make.bottom.lessThanOrEqualToSuperview().inset(8)
            }
            
            ratingImageView.snp.makeConstraints{ (make) -> Void in
                make.size.equalTo(8)
            }
        }
        
        func setupAdditionalConfiguration() {
            
        }
        
        func setup(model: Model.Show) {
            titleLabel.text = model.name
            if let urlString = model.image?.medium ?? model.image?.original {
                posterImageView.imageBy(url: URL(string: urlString), placeholder: UIImage.posterPlaceholder)
            }
            if let genres = model.genres, !genres.isEmpty {
                genresLabel.text = genres.joined(separator: ", ")
            }
            if let rating = model.rating?.average {
                ratingLabel.text = "\(rating)"
            } else {
                ratingStackView.isHidden = true
            }
        }
        
    }
    
}

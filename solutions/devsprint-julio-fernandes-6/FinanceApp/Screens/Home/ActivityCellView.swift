//
//  ActivityCellView.swift
//  FinanceApp
//
//  Created by Joao Gripp on 31/08/22.
//

import UIKit

class ActivityCellView: UITableViewCell {
    
    static let cellIdentifier = "ActivityCellView"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .preferredFont(forTextStyle: .title3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.font = .preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var activityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var stackVerticalView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.axis = .vertical
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(detailLabel)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var stackHorizontalView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.axis = .horizontal
        stack.spacing = 16
        stack.addArrangedSubview(activityImageView)
        stack.addArrangedSubview(stackVerticalView)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    init(title: String, price: Float = 100, time: String = "8:57 am") {
        super.init(style: .default, reuseIdentifier: ActivityCellView.cellIdentifier)
        setupView()
        activityImageView.image = UIImage(systemName: "heart.circle.fill")
        titleLabel.text = title
        detailLabel.text = String.activityDetails(with: price, and: time)
        
    }
}

//MARK: - Extension and Protocol
extension ActivityCellView: ViewCodeProtocol {

    func buildViewHierarchy() {
        contentView.addSubview(stackHorizontalView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackHorizontalView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackHorizontalView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackHorizontalView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stackHorizontalView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            activityImageView.widthAnchor.constraint(equalToConstant: 60),
            activityImageView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}



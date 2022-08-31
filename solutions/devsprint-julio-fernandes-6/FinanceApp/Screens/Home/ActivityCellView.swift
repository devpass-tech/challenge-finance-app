//
//  ActivityCellView.swift
//  FinanceApp
//
//  Created by Joao Gripp on 31/08/22.
//

import UIKit

class ActivityCellView: UITableViewCell {
    
//    static let cellIdentifier = "activityCellView"
    
//    MARK: - Building Cell Elements
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
//        label.textColor =
        label.font = .preferredFont(forTextStyle: .title1)
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
    
    lazy var activityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.frame.height / 2
        return imageView
    }()
    
    private lazy var stackVerticalView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.axis = .vertical
        stack.spacing = 8
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
    
//    MARK: - Init the Cell
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    
//    MARK: - Func to populate the cell
    func setup(activityImage: UIImage?, title: String, price: Float = 100, time: String = "8:57 am" ) {
        activityImageView.image = activityImage ?? UIImage(systemName: "heart.circle.fill")
        titleLabel.text = title
        detailLabel.text = String.activityDetails(with: price, and: time)
    }
}

//MARK: - Extension and Protocol

extension ActivityCellView: ViewCodeCellProtocol {
//    To build on the view
    func buildViewHierarchy() {
        contentView.addSubview(stackHorizontalView)
    }
    
//    Constrains
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackHorizontalView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackHorizontalView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackHorizontalView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackHorizontalView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
    }
}

protocol ViewCodeCellProtocol {
    func setupView()
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
}

extension ViewCodeCellProtocol {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}

extension ViewCodeCellProtocol where Self: UITableViewCell {
    func setupAdditionalConfiguration() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
    }
}

//
//  ActivityCellView.swift
//  FinanceApp
//
//  Created by Joao Gripp on 31/08/22.
//

import UIKit

final class ActivityCellView: UITableViewCell {

   private lazy var mainStackView: UIStackView = {
       let stack = UIStackView(frame: .zero)
       stack.translatesAutoresizingMaskIntoConstraints = false
       stack.spacing = 8
       stack.alignment = .center
       stack.isLayoutMarginsRelativeArrangement = true
       stack.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
       stack.addArrangedSubview(categoryImageView)
       stack.addArrangedSubview(labelsStackView)
       return stack
    }()

    private lazy var labelsStackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        stack.addArrangedSubview(activityNameLabel)
        stack.addArrangedSubview(activityInfoLabel)
        return stack
    }()

    private lazy var categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "bag.circle.fill")
        imageView.tintColor = .systemPurple
        return imageView
    }()

    private lazy var activityNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()

    private lazy var activityInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        setupView()
    }

    required init?(coder: NSCoder) {
        return nil
    }
}

// MARK: ViewCodeProtocol
extension ActivityCellView: ViewCodeProtocol {
    func buildViewHierarchy() {
        addSubview(mainStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            categoryImageView.widthAnchor.constraint(equalToConstant: 50),
            categoryImageView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

extension ActivityCellView {
    func setupCell(activity: Activity) {
        activityNameLabel.text = activity.name
        activityInfoLabel.text = String.activityDetails(with: activity.price, and: activity.time)
    }
}

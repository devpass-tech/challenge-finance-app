//
//  HomeView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//
protocol HomeViewProtocol: AnyObject {
    func goToActivityDetailsViewController()
}

import UIKit

struct HomeViewConfiguration {
    
    let activities: [String]
}

final class HomeView: UIView {
    
    weak var delegate: HomeViewProtocol?
    private let listViewCellIdentifier = "ListViewCellIdentifier"
    private var activities: [String] = []
    
    //MARK: Interface Components
    private lazy var tableView: UITableView = {
        
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.listViewCellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    private lazy var vStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.spacing = 10
        stack.axis = .vertical
        stack.addArrangedSubview(valueLabel)
        stack.addArrangedSubview(savingsHStack)
        stack.addArrangedSubview(spendingsHStack)
        stack.backgroundColor = .blue
        stack.distribution = .fill
        return stack
    }()
    
    private lazy var savingsHStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 0
        stack.axis = .horizontal
        stack.addArrangedSubview(savingsLabel)
        stack.addArrangedSubview(savingsValueLabel)
        stack.backgroundColor = .white
        return stack
    }()
    
    private lazy var spendingsHStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 0
        stack.axis = .horizontal
        stack.addArrangedSubview(spendingLabel)
        stack.addArrangedSubview(spendingValueLabel)
        stack.backgroundColor = .white
        return stack
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$15,459.27"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .black
        label.backgroundColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private lazy var savingsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Savings"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private lazy var savingsValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$2.500"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .gray
        label.textAlignment = .right
        return label
    }()
    
    private lazy var spendingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Spending"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private lazy var spendingValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$3.547"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .gray
        label.textAlignment = .right
        return label
    }()
    
    private lazy var bagImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "bag.circle.fill")
        image.contentMode = .scaleAspectFill
        image.tintColor = UIColor(red: 190/255, green: 81/255, blue: 255/255, alpha: 1)
        return image
    }()
    
    init() {
        
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with activities: [String]) {
        
        self.activities = activities
        self.tableView.reloadData()
    }
    
    func setupViews() {
        
        self.backgroundColor = .white
        
        self.initSubviews()
        self.initConstraints()
    }
}


extension HomeView: ConfigurableView {
    
    func initSubviews() {
        
        addSubview(tableView)
        addSubview(vStack)
        
    }
     func initConstraints() {
         
         let leadingDefault: CGFloat = 16
         let trailingDefault: CGFloat = -16
        
        
         NSLayoutConstraint.activate([
             vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
             vStack.trailingAnchor.constraint(equalTo: trailingAnchor),
             vStack.topAnchor.constraint(equalTo: topAnchor),
             vStack.centerXAnchor.constraint(equalTo: centerXAnchor),
             valueLabel.heightAnchor.constraint(equalToConstant: 120),
             valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadingDefault),
             valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: trailingDefault),
             valueLabel.topAnchor.constraint(equalTo: topAnchor, constant: leadingDefault),
         ])
         
        NSLayoutConstraint.activate([
             savingsHStack.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 10),
             savingsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadingDefault),
             savingsValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: trailingDefault),
             ])
             
        NSLayoutConstraint.activate([
             spendingsHStack.topAnchor.constraint(equalTo: savingsHStack.bottomAnchor),
             spendingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadingDefault),
             spendingValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: trailingDefault),
         ])
         
         NSLayoutConstraint.activate([
             tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
             tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
             tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
             tableView.topAnchor.constraint(equalTo: vStack.bottomAnchor, constant: 30)
         ])
    }
}
    

    //MARK: UITableViewDataSource
extension HomeView: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.activities.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.listViewCellIdentifier)!
        cell.textLabel?.text = self.activities[indexPath.row]
        return cell
    }
}

//MARK: UITableViewDelegate
extension HomeView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            delegate?.goToActivityDetailsViewController()
    }
}




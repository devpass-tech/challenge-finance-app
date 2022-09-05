//
//  LoadingView.swift
//  FinanceApp
//
//  Created by Joao Gripp on 30/08/22.
//

import UIKit

class LoadingView: UIView {
    
    var loadingSpinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    var titleLabel: UILabel = UILabel()
    var title: String?
    
    init() {
        super.init(frame: .zero)
        
        setupView()
        
        self.addSubview(loadingSpinner)
        self.addSubview(titleLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.titleLabel.text = title ?? "Buscando Informações"
        
        self.loadingSpinner.startAnimating()
    }
}

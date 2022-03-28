//
//  DSLabel.swift
//  FinanceApp
//
//  Created by Renato Sarro on 25/03/22.
//

import UIKit

enum DSLabel {
    case bigTitle(color: DSColor)
    case subheadline(color: DSColor)
    case footnote(color: DSColor)
    case titleThree(color: DSColor)
    case body(color: DSColor)
    case callout(color: DSColor)
    case caption(color: DSColor)
    
    func build() -> UILabel {
        switch self {
        case .bigTitle(let color):
            return configBigTitle(with: color)
        case .subheadline(let color):
            return configSubheadline(with: color)
        case .footnote(let color):
            return configFootnote(with: color)
        case .titleThree(let color):
            return configTitleThree(with: color)
        case .body(let color):
            return configBody(with: color)
        case .callout(let color):
            return configCallout(with: color)
        case .caption(let color):
            return configCaption(with: color)
        }
    }
    
    private func configBigTitle(with textColor: DSColor) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 34, weight: .bold)
        label.textColor = textColor.color
        
        return label
    }
    
    private func configSubheadline(with textColor: DSColor) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textColor = textColor.color
        
        return label
    }
    
    private func configFootnote(with textColor: DSColor) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = textColor.color
        
        return label
    }
    private func configTitleThree(with textColor: DSColor) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = textColor.color
        
        return label
    }
    private func configBody(with textColor: DSColor) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = textColor.color
        
        return label
    }
    private func configCallout(with texColor: DSColor) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = texColor.color
        
        return label
    }
    private func configCaption(with textColor: DSColor) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = textColor.color
        
        return label
    }
}

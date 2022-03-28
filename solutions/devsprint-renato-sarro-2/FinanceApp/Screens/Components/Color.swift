//
//  Color.swift
//  FinanceApp
//
//  Created by Renato Sarro on 25/03/22.
//

import UIKit

enum DSColor {
    case primary
    case secondary
    
    var color: UIColor {
        switch self {
        case .primary:
            return UIColor(named: "primary") ?? UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        case .secondary:
            return UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        }
    }
}

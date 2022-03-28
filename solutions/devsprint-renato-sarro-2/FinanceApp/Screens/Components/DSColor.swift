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
    case blue
    case gray
    case green
    case lightGray
    case red
    case purple
    case lightBlue
    case orange
    case lightGreen
    
    var color: UIColor {
        switch self {
            case .primary:
                return UIColor(named: "primary") ?? UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            case .secondary:
                return UIColor(named: "secondary") ?? UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
            case .blue:
                return UIColor(named: "blue") ?? UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
            case .gray:
                return UIColor(named: "gray") ?? UIColor(red: 0.898, green: 0.898, blue: 0.918, alpha: 1)
            case .lightGray:
                return UIColor(named: "lightGray") ?? UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            case .red:
                return UIColor(named: "red") ?? UIColor(red: 1, green: 0.231, blue: 0.188, alpha: 1)
            case .green:
                return UIColor(named: "green") ?? UIColor(red: 0.196, green: 0.843, blue: 0.294, alpha: 1)
            case .purple:
                return UIColor(named: "purple") ?? UIColor(red: 0.686, green: 0.322, blue: 0.871, alpha: 1)
            case .lightBlue:
                return UIColor(named: "lightBlue") ?? UIColor(red: 0.353, green: 0.784, blue: 0.98, alpha: 1)
            case .orange:
                return UIColor(named: "orange") ?? UIColor(red: 1, green: 0.624, blue: 0.039, alpha: 1)
            case .lightGreen:
                return UIColor(named: "lightGreen") ?? UIColor(red: 0.204, green: 0.78, blue: 0.349, alpha: 1)
        }
    }
}

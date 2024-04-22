//
//  ColorCodes.swift
//  Weather
//
//  Created by Ehtisham Badar on 22/04/2024.
//

import UIKit

enum TemperatureColor: CaseIterable {
    case veryCold
    case cold
    case cool
    case mild
    case warm
    case warmer
    case mildWarm
    case hot
    case veryHot
    case extremelyHot
    case scorching
    case burning
    
    var color: UIColor {
        switch self {
        case .veryCold: return UIColor(red: 0.5, green: 0, blue: 0.5, alpha: 1)
        case .cold: return UIColor.purple
        case .cool: return UIColor.blue
        case .mild: return UIColor.cyan
        case .warm: return UIColor.green
        case .warmer: return UIColor.yellow
        case .mildWarm: return UIColor.orange
        case .hot: return UIColor.red
        case .veryHot: return UIColor(red: 1, green: 0.5, blue: 0, alpha: 1)
        case .extremelyHot: return UIColor(red: 1, green: 0.25, blue: 0, alpha: 1)
        case .scorching: return UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        case .burning: return UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        }
    }
    
    static func color(for temperature: Double) -> UIColor {
        switch temperature {
        case let x where x<=0:
            return UIColor.hexStringToUIColor(hex: "8f25a7")
        case 0.1...10:
            return UIColor.hexStringToUIColor(hex: "5836ab")
        case 10.1...20.9:
            return UIColor.hexStringToUIColor(hex: "334bab")
        case 21...30.9:
            return UIColor.hexStringToUIColor(hex: "4770f7")
        case 31...40.9:
            return UIColor.hexStringToUIColor(hex: "0ba1f1")
        case 41...50.9:
            return UIColor.hexStringToUIColor(hex: "1ab7cc")
        case 51...60.9:
            return UIColor.hexStringToUIColor(hex: "168b7d")
        case 61...70.9:
            return UIColor.hexStringToUIColor(hex: "2e8e2b")
        case 71...80.9:
            return UIColor.hexStringToUIColor(hex: "83b947")
        case 81...90.9:
            return UIColor.hexStringToUIColor(hex: "feb727")
        case 91...100:
            return UIColor.hexStringToUIColor(hex: "fe8a21")
        default:
            return UIColor.hexStringToUIColor(hex: "fc4827")
        }
    }
}
extension UIColor {
    static func hexStringToUIColor (hex: String, opacity: CGFloat? = 1.0) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        if (cString.count) != 6 {
            return UIColor.gray
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue) // scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(opacity ?? 1.0)
        )
    }
}

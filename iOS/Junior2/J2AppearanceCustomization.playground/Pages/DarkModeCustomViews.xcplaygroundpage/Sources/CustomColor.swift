import UIKit

public extension UIColor {
    static let customBackgroundColor = UIColor {
        switch $0.userInterfaceStyle {
        case .dark:
            return .yellow
        case .light, .unspecified:
            return .blue
        }
    }
}

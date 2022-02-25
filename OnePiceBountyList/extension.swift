import UIKit

extension Int {
    var commaSeperated: String {
        let decimalFormatter = NumberFormatter()
        decimalFormatter.numberStyle = NumberFormatter.Style.decimal
         
        return decimalFormatter.string(from: self as NSNumber)!
    }
}

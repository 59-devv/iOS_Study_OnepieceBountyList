import UIKit

extension Double {
    var commaSeperated: String {
        let decimalFormatter = NumberFormatter()
        decimalFormatter.numberStyle = NumberFormatter.Style.decimal
        decimalFormatter.maximumFractionDigits = -1
        
        return decimalFormatter.string(from: self as NSNumber)!
    }
}

let someNumber: Double = 111123.56756756

print(someNumber)   // 111123.56756756
print(someNumber.commaSeperated)    // 111,123.567568



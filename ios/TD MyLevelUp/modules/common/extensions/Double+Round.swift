import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func round(toPlaces places:Int = 2) -> Double {
        return (self*100).rounded()/100
    }
}

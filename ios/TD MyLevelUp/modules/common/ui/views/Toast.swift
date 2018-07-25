import Foundation
import UIKit

class Toast
{
    class private func showAlert(backgroundColor:UIColor = .darkGray, textColor:UIColor = .white, message:String)
    {
        let alertController = UIAlertController(title: "Ooops", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
//        self.navigationController?.present(alertController, animated: true, completion: nil)
    }
    
    class func showPositiveMessage(message:String)
    {
        showAlert(backgroundColor: UIColor.green, textColor: UIColor.white, message: message)
    }
    class func showNegativeMessage(message:String)
    {
        showAlert(backgroundColor: UIColor.red, textColor: UIColor.white, message: message)
    }
}

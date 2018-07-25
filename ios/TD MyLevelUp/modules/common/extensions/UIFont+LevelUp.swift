import UIKit

/// Extension that creates a UIFont for TD MyLevelUp.
extension UIFont {
    
    /**
     Returns the Default Howdi Font with the size of 17.0
     */
    public static var standard : UIFont {
        return UIFont(name: "HKGrotesk-Regular", size: 17.0)!
    }
    
    /**
     Returns the Medium Howdi Font with the size of 17.0
     */
    public static var medium : UIFont {
        return UIFont(name: "HKGrotesk-Medium", size: 17.0)!
    }
    
    /**
     Returns the Bold Howdi Font with the size of 17.0
     */
    public static var bold : UIFont {
        return UIFont(name: "HKGrotesk-SemiBold", size: 17.0)!
    }
    
    /**
     Returns the Heavy Howdi Font with the size of 17.0
     */
    public static var heavy : UIFont {
        return UIFont(name: "HKGrotesk-Bold", size: 17.0)!
    }
    
    /**
     Returns the Default Howdi Font with the size of a custom size.
     - Parameter size: The desired font size.
     */
    public static func standard(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "HKGrotesk-Regular", size: size)!
    }
    
    /**
     Returns the Medium Howdi Font with the size of a custom size.
     - Parameter size: The desired font size.
     */
    public static func medium(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "HKGrotesk-Medium", size: size)!
    }
    
    /**
     Returns the Bold Howdi Font with the size of a custom size.
     - Parameter size: The desired font size.
     */
    public static func bold(withSize size : CGFloat) -> UIFont {
        return UIFont(name: "HKGrotesk-SemiBold", size: size)!
    }
    
    /**
     Returns the Heavy Howdi Font with the size of a custom size.
     - Parameter size: The desired font size.
     */
    public static func heavy(withSize size : CGFloat) -> UIFont {
        return UIFont(name: "HKGrotesk-Bold", size: size)!
    }
}

//
//  UIColor.Extensions.swift
//  TheMarketApp
//
//  Created by Administrator on 23/02/19.
//  Copyright © 2019 Sreelekh. All rights reserved.
//

import Foundation

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    class func AbrajDarkBlue() -> UIColor
    {
        return UIColor(red: 0.0/255.0, green: 54.0/255.0, blue: 100.0/255.0, alpha: 1)
    }
    class func AbrajDarkBlueLighter() -> UIColor
    {
        return UIColor(red: 0.0/255.0, green: 54.0/255.0, blue: 100.0/255.0, alpha: 0.4)
    }
    class func AbrajCommonNaviColor() -> UIColor
    {
        return UIColor(red: 167.0/255.0, green: 133.0/255.0, blue: 79.0/255.0, alpha: 1)
    }
    class func AbrajCommonNaviLight() -> UIColor
    {
        return UIColor(red: 167.0/255.0, green: 133.0/255.0, blue: 79.0/255.0, alpha: 0.4)
    }
    class func starlinkShadow() -> UIColor
    {
        return UIColor(red: 123.0/255.0, green: 144.0/255.0, blue: 157.0/255.0, alpha: 1)
    }
    
    class func signInBlack() -> UIColor
    {
        return UIColor(red: 65.0/255.0, green: 82.0/255.0, blue: 92.0/255.0, alpha: 1.0)
    }
    class func myColor() -> UIColor
    {
        return UIColor( red: 173/255, green: 112/255, blue:238/255, alpha: 1.0 )
    }
    class func myColor_2() -> UIColor
    {
        return UIColor( red: 236/255, green: 162/255, blue:94/255, alpha: 1.0 )
    }
    class func myColor_3() -> UIColor
    {
        return UIColor( red: 97/255, green: 169/255, blue:236/255, alpha: 1.0 )
    }
    class func myColor_4() -> UIColor
    {
        return UIColor( red: 117/255, green: 119/255, blue:238/255, alpha: 1.0 )
    }
    class func myColor_5() -> UIColor
    {
        return UIColor( red: 238/255, green: 116/255, blue:118/255, alpha: 1.0 )
    }
    class func BackgroundShadow() ->UIColor
    {
        return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
    }
    
}

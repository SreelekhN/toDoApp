//
//  String.Extensions.swift
//  TheMarketApp
//
//  Created by Administrator on 23/02/19.
//  Copyright © 2019 Sreelekh. All rights reserved.
//

import Foundation

extension String {
    
    var withoutHtmlTags: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
    //MARK :- Numeric
    
    var isNumeric: Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }
    
    func trim() -> String
    {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
    
    
    
    
    
}

//Calling to a number

extension String {
    enum RegularExpressions: String {
        case phone = "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$"
    }
    
    func isValid(regex: RegularExpressions) -> Bool {
        return isValid(regex: regex.rawValue)
    }
    
    func isValid(regex: String) -> Bool {
        let matches = range(of: regex, options: .regularExpression)
        return matches != nil
    }
    
    func onlyDigits() -> String {
        let filtredUnicodeScalars = unicodeScalars.filter{CharacterSet.decimalDigits.contains($0)}
        return String(String.UnicodeScalarView(filtredUnicodeScalars))
    }
    
    func makeACall() {
        if isValid(regex: .phone) {
            if let url = URL(string: "tel://\(self.onlyDigits())"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
}

extension String {
    func substring(with nsrange: NSRange) -> Substring? {
        guard let range = Range(nsrange, in: self) else { return nil }
        return self[range]
    }
}

// MARK: - make string to date

extension String {
    func date(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        let date = dateFormatter.date(from: self)
        return date
    }
}

extension String {
    func changeDate(_ mydate:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let convertedDate = dateFormatter.date(from: mydate)
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date = dateFormatter.string(from: convertedDate!)
        return date
    }
}

extension String {
    
    func toLengthOf(length:Int) -> String {
        if length <= 0 {
            return self
        } else if let to = self.index(self.startIndex, offsetBy: length, limitedBy: self.endIndex) {
            return self.substring(from: to)
            
        } else {
            return ""
        }
    }
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}

extension String {
    
    func getMonthAndDayFromString() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)
        if LanguageManager.shared.currentLanguage == .ar {
            dateFormatter.locale = NSLocale(localeIdentifier: "ar") as Locale
        }else{
            dateFormatter.locale = NSLocale(localeIdentifier: "en") as Locale
        }
        dateFormatter.dateFormat = "dd MMM"
        let dateInStrFormat = dateFormatter.string(from: date!)
        return dateInStrFormat
    }
    
    func getDateFromString() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "E, MMM dd"
        let dateInStrFormat = dateFormatter.string(from: date!)
        return dateInStrFormat
    }
    
    func dateRotate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let dateInStrFormat = dateFormatter.string(from: date!)
        return dateInStrFormat
    }
    func getTimeFromString() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        var dateAsStrWithColn: String = self
        dateAsStrWithColn.insert(":", at: dateAsStrWithColn.index(dateAsStrWithColn.startIndex, offsetBy: 2))
        let date = dateFormatter.date(from: dateAsStrWithColn)
        dateFormatter.dateFormat = "HH:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        let dateInStrFormat = dateFormatter.string(from: date!)
        return dateInStrFormat
    }
    func getTimeFromStringDetailPage() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "HH:mm"
        let dateInStrFormat = dateFormatter.string(from: date!)
        return dateInStrFormat
    }
    func getTimeFromStringDetailPage1() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        var dateAsStrWithColn: String = self
        dateAsStrWithColn.insert(":", at: dateAsStrWithColn.index(dateAsStrWithColn.startIndex, offsetBy: 2))
        let date = dateFormatter.date(from: dateAsStrWithColn)
        dateFormatter.dateFormat = "HH:mm"
        let dateInStrFormat = dateFormatter.string(from: date!)
        return dateInStrFormat
    }
    func identifyBookindClassFromCode() -> String{
        var classType = ""
        switch self {
        case "Y":
            classType = "Economy"
        case "F":
            classType = "First Class"
        case "W":
            classType = "Premium Economy"
        case "C":
            classType = "Business"
        default:
            classType = "Undefined!!"
            break
        }
        return classType
    }
    func identifyBookingCode() -> String{
        var classType = ""
        switch self {
        case "Economy":
            classType = "Y"
        case "First Class":
            classType = "F"
        case "Premium Economy":
            classType = "W"
        case "Business":
            classType = "C"
        default:
            classType = "Undefined!!"
            break
        }
        return classType
    }
    
    var removeExcessiveSpaces: String {
        let components = self.components(separatedBy: CharacterSet.whitespaces)
        let filtered = components.filter({!$0.isEmpty})
        return filtered.joined(separator: " ")
    }
    func removeBrackets() -> String {
        var str : NSString = self as NSString
        str = str.replacingOccurrences(of: "(", with: "") as NSString
        str = str.replacingOccurrences(of: ")", with: "") as NSString
        str = str.replacingOccurrences(of: " ", with: "") as NSString
        str = str.replacingOccurrences(of: "-", with: "") as NSString
        str = str.replacingOccurrences(of: "+", with: "") as NSString
        return str as String
    }
    func validateEmail() -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
        
    }
    func changePhoneNumberFormat(countryIsIndia:Bool) -> String{
        //+1(---)xxx-xxxx
        var charArray = [String]()
        for char in self{
            charArray.append(String(char))
        }
        charArray.insert("+", at: 0)
        print(charArray)
        if countryIsIndia {
            charArray.insert("(", at: 3)
            charArray.insert(")", at: 7)
            charArray.insert("-", at: 11)
            print(charArray)
        } else{
            charArray.insert("(", at: 2)
            charArray.insert(")", at: 6)
            charArray.insert("-", at: 10)
            print(charArray)
        }
        print(charArray)
        let string = charArray.map { String($0) }.joined(separator: "")
        return(string)
    }
    
    func superScriptPrice() -> NSAttributedString {
        let priceSplitbyDecimalPoint = self.components(separatedBy: ".")
        print(priceSplitbyDecimalPoint)
        let font = UIFont(name: "SFProDisplay-Bold", size:17)
        let fontSuper = UIFont(name: "SFProDisplay-Bold", size:12)
        
        let attributedString = NSMutableAttributedString(string: priceSplitbyDecimalPoint[0]+"." + priceSplitbyDecimalPoint[1], attributes: [NSAttributedString.Key.font:font!])
        attributedString.setAttributes([NSAttributedString.Key.font:fontSuper!, NSAttributedString.Key.baselineOffset:10], range: NSRange(location:priceSplitbyDecimalPoint[0].count+1, length:priceSplitbyDecimalPoint[1].count))
        return(attributedString)
        
    }
}


extension String {
    func capitalizingFirstLetter() -> String {
        let first = String(prefix(1)).capitalized
        let other = String(dropFirst())
        return first + other
    }
}

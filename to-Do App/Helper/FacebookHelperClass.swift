/*
https://developers.facebook.com/
 Log in
 Add App
 Dont forget to Make Your Project.(App Review - Your app is currently live and available to the public)
*/

/*  Pod Install
 pod 'FacebookCore'
 pod 'FacebookLogin'
 pod 'FacebookShare'
 */

/*  Appdelegate.swift
 
 import FBSDKLoginKit
 func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
 {
 return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
 }
 
 
 func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool
 {
 return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
 }
 
 
 func applicationWillResignActive(_ application: UIApplication)
 {
 FBSDKAppEvents.activateApp()
 }
 */
// commnted by Ramya

import Foundation
import UIKit
import FBSDKLoginKit
import FacebookLogin



public struct facebookDictionary {
    public var name : String = ""
    public var imagedata : Any? = nil
    public var userId : String = ""
    public var email : String = ""
    public var token : String = ""
}




var imageData = Data()
var userid = String()
var email = String()

public class Facebook
{
    static let facebookLoginManager = LoginManager()
    static var profilename = String()
    
    class func LoginRequest(viewcontroller: UIViewController, completion : @escaping(Bool,facebookDictionary) -> Void)
    {
        
        facebookLoginManager.logIn(permissions: [.publicProfile, .email], viewController: viewcontroller, completion: {
            (LoginResult) in
            
            switch LoginResult{
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                
                if((AccessToken.current) != nil)
                {
                    GraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                        if (error == nil)
                        {
                            //      dict = result as! [String : AnyObject]
                            
                            guard let userInfo = result as? [String: Any] else { return } //handle the error
                            if let profileName = userInfo["name"]
                            {
                                profilename = (profileName as? String)!
                            }
                            if let useriD = userInfo["id"]
                            {
                                userid = (useriD as? String)!
                            }
                            if let useremail = userInfo["email"]
                            {
                                email = (useremail as? String)!
                            }
                            if let imageURL = ((userInfo["picture"] as? [String: Any])?["data"] as? [String: Any])?["url"] as? String
                            {
                                //Download image from imageURL
                                if let url = NSURL(string: imageURL) {
                                    if let data = NSData(contentsOf: url as URL) {
                                        imageData = data as Data
                                    }
                                }
                            }
                            
                            
                            let dict = facebookDictionary(name: profilename, imagedata: imageData, userId: userid, email: email, token: AccessToken.current?.tokenString ?? "")
                            completion(true, dict)
                        }
                    })
                }
                
            case .failed(let ErrorRecvd):
                print("error",ErrorRecvd)
                let dict = facebookDictionary(name: "", imagedata: nil, userId: "", email: "", token: "")
                completion(false, dict)
                
            case .cancelled:
                print("cancelled")
                let dict = facebookDictionary(name: "", imagedata: nil, userId: "", email: "", token: "")
                completion(false, dict)
            }
            
        })
        
        
    }
    
    
    class func LogoutRequest()
    {
        facebookLoginManager.logOut()
        facebookLoginManager.loginBehavior = .browser
    }
    
    
    
}





// Your ViewController
/*
 @IBAction func LoginButton(_ sender: Any)
 {
 Facebook.LoginRequest(viewcontroller: self, completion: { (isFinished, dic) in
 if isFinished
 {
 print(dic)
 self.profileLabel.text = dic.name
 self.imageview.image = UIImage(data: dic.imagedata as! Data)
 }
 
 })
 
 }
 
 @IBAction func LogoutButton(_ sender: Any)
 {
 Facebook.LogoutRequest()
 imageview.image = nil
 profileLabel.text = ""
 }
 
 */


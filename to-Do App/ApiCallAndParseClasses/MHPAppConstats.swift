//  MHPAppConstats.swift


import UIKit

struct AppDetails {
    //App Details
    static let APP_NAME = "app_name"
    static let ITUNES_URL = ""
    static let BUNDIL_ID = ""
    static let Google_Api_Key = "AIzaSyC6yrSowoFQWMJLD6nAEkCy33rZPbayVL4"
    
}
let appsession = UIApplication.shared.delegate as! AppDelegate
var sbMain = UIStoryboard(name: "Main", bundle: nil)

struct AppURL {
    //App Details
    //Base URLs
    
    static let BASE_URL = "http://organictotheroots.com/abrajcms/api/"
    static let IMAGE_BASE_URL = "http://organictotheroots.com/abrajcms/"
    
    //Get URLs
    static let GET_ACCESS_TOKEN = BASE_URL + "get-access-token"
    static let LOGIN_API = BASE_URL + "login"
    static let REG_API = BASE_URL + "register"
    static let COUNTRY_LIST = BASE_URL + "get-country-list"
    static let RESET_PASSWORD = BASE_URL + "password-reset"
    static let CHANGE_PASSWORD = BASE_URL + "set-new-password"
    static let USER_PROFILE = BASE_URL + "get-profile-details"
    static let GET_VIDEO = BASE_URL + "get-video"
    static let UPDATE_PROFILE = BASE_URL + "update-profile-details"
    static let UPDATE_PROFILE_PASSWORD = BASE_URL + "update-password"
    static let GET_SETTING = BASE_URL + "get-settings"
    static let UPDATE_SETTING = BASE_URL + "update-settings"
    static let LOCALIZE_STRING = BASE_URL + "localized-string"
    static let GET_BANNER = BASE_URL + "get-banner-elements"
    static let GET_FEATURE_BANNER = BASE_URL + "get-featured-banner"
    static let GET_MARKETING_BANNER = BASE_URL + "get-marketing-banner"
    static let GET_MENU = BASE_URL + "mobile-menu"
    static let FILTER_ITEMS = BASE_URL + "get-search-property"
    static let SEARCH_RESULT = BASE_URL + "search-result"
    static let UNIT_DETAILS = BASE_URL + "get-property-details"
    static let MAN_FAV = BASE_URL + "manage-favourite"
    static let GET_NOTIFICATION_TYPE = BASE_URL + "get-notification-type"
    static let UPDATE_NOTIFICATION_TYPE = BASE_URL + "user-notification-status"
    static let LOG_OUT_API = BASE_URL + "log-out"
    static let GET_NOTIFICATION = BASE_URL + "get-notification"
    static let LIFE_AT_ABRAJ_API = BASE_URL + "get-abraj-content"
    static let GET_PROFILE = BASE_URL + "get-profile-details"
    static let GET_FAV = BASE_URL + "get-favourite"
    static let ADD_DEL_FAV = BASE_URL + "manage-favourite"
    static let PROPERTY_VIEW_TRACK = BASE_URL + "user-property-view"
    static let GET_CONTACT_US = BASE_URL + "get-contact-list"
    static let GET_BROCHURE = BASE_URL + "get-documents"
    
}


@available(iOS 10.0, *)
class AppData: NSObject {
    
    var storyboard: UIStoryboard!
    let appDelegate: AppDelegate!
    
    static let GOOGLE_API_KEY = "AIzaSyCT6kV8IyLOfDZJXAGRFzxFDiUvkEGxYSk"
    
    //MARK: - Shared Instance
    
    static let sharedAD = AppData()
    
    override init() {
        self.storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    }
    
    static let csCopy = CharacterSet(bitmapRepresentation: CharacterSet.urlPathAllowed.bitmapRepresentation)
}


struct AppViewTitle {
    //App Title
    
}

struct AppAlertTitle {
    //App Alert Title

}

struct AppAlertMsg {
    //App Alert Msg
    static let NetWorkAlertMessage = "no_internet"
    static let serverNotReached = "The server could not be reached because of a connection problem"
    static let NoNotification = "No notification"
    
    //Register Alert
    static let NATIONALITY_EMPTY = "error_country_required"
    static let FULL_NAME_EMPTY = "Name cannot be empty"
    static let FULL_NAME_VALID = "Enter a valid name."
    static let FIRST_NAME_EMPTY = "error_first_name_required"
    static let LAST_NAME_EMPTY = "Last Name cannot be empty"
    static let EMAIL_EMPTY = "error_email_required"
    static let ADDRESS_VALID = "Please enter a valid address."
    static let CONFIRM_PASSWORD_EMPTY = "error_confirm_required"
    static let LOGIN_ID_EMPTY = "Login ID cannot be empty"
    static let PASSWORD_EMPTY = "error_password_required"
    static let INVALID_APPOINMENTID = "Invalid Appointment ID"
    static let PH_EMAIL_EMPTY = "Phone Number/Email Address cannot be empty"
    static let INVALID_PHONE = "error_mobile_invalid"
    static let INVALID_EMAIL = "error_invalid_email"
    static let INVALID_PASSWORD = "invalid_password"
    static let SELECT_ORDERID = "Select Order"
    static let REVIEW_ALREADY_COMPLETED = "You have already submitted the review."
    static let FIRST_NAME_ATLEAST = "error_first_name_min_length"
    static let USERNAME_ATLEAST = "Username must be at least 3 characters long"
    static let PASSWORD_NOT_MATCH = "error_confirm_password"
    static let PASSWORD_ATLEAST = "error_password_min_length"
    static let PASSWORD_INVALID = "Passwords must include one alphabet, one digit & one special character"
    static let LAST_NAME = "error_last_name_required"
    static let FULL_NAME_NUMERIC = "FN_numeric_characters"
    static let LAST_NAME_NUMERIC = "LN_numeric_characters"
    static let USERNAME_NUMERIC = "Username cannot contain numeric characters"
    static let LOGOUT_MSG       = "logout_message"
    static let NO_SURVAY       = "No Survey Available"
    static let SELECT_ANSWER   = "Please select your answer"
    static let PLEASE_ENTER_TITLE   = "Please enter a title."
    static let PLEASE_ENTER_DES   = "Please enter description."
    static let PLEASE_LOGIN   = "Please login to continue."
    static let VALID_NAME   = "enter_valid_name"
    static let ENTER_CITY   = "Please enter a city."
    static let ENTER_ADDRESS  = "Please enter a address."
    static let MIN_PASSWORD = "Password needs minimum 8 characters."
    static let TERMS = "Please agree to the terms and conditions."
//    static let OUT_OF_ZONE = "The location selected is out of delivery zone".localiz()
//    static let PLEASE_ENTER_COMMENTS = "Please enter your comment".localiz()
    static let COMMENTS_LENGTH = "Comment should be atleast 20 characters long."
    static let BILLING_EPY = "Billing address is empty"
    static let SHIPPING_EPY = "Shipping address is empty"
    static let ENTER_CURRENT_PASSWORD = "Please enter your current password"
    static let ENTER_NEW_PASSWORD = "re_enter_password"
    static let RE_ENTER_NEW_PASSWORD = "Please re-enter your new password"
    static let OLD_PASS_NEW_PASSWORD_SAME = "Your old password and new password is the same"
    static let ENTER_REVIEW_TITLE = "Please enter your review title"
    static let ENTER_REVIEW_COMMENT = "Please enter your review comment"
    static let ENTER_REVIEW_COMMENT_LONG = "Your review should be atleast more than 10 characters"
    static let NO_DEFAULT_ADDRESS = "You dont have any default address"
    static let PLEASE_SELECT_CARD_TYPE = "Please select a card type"
    static let PASS_CONFIRMPASS_SAME = "error_confirm_password"
    static let NOT_AUTHORISED = "User is not authourised to access the app"
    
    static let EXCEED_CHAR_LIMIT = "The character limit has been exceeded"
    static let VIDEO_CANT_BE_LOAD_THIS_TIME = "video_not_loading"
    static let NO_ROOMS_AVAILABLE = "no_available_units"
    static let COMING_SOON = "coming_soon_text"
    
}

struct AppButtonTitles {

    static let okTitle = "ok_text"
    static let retry = "retry_text"
    static let resetPassword = "reset_password_text"
    static let cancel = "cancel"
}


struct MHPSeuges {
    
    static let signInVCSegue = "signInVCSegue"
    static let signToSignUpSegue = "signToSignUpSegue"
    static let baseToHomeScreen = "baseToHomeScreen"
    
}
struct storyboardIdentifier {
    
    static let mainStoryBoard   = "Main"
    static let AB_LoginViewController   = "AB_LoginViewController"
    static let AB_RegisterViewController   = "AB_RegisterViewController"
    static let AppTabBarController = "AbrajTabBar"
    static let AB_SplashScreen = "AB_SplashScreen"
    static let AB_LoginOrSignUpScreen = "AB_LoginOrSignUpScreen"
    static let AB_LoginOrSignUpScreenNav = "AB_LoginOrSignUpScreenNav"
    
    static let AB_HomeNav = "AB_HomeNav"
    static let AB_HomeViewController = "AB_HomeViewController"
    static let AB_NotificationNav = "AB_NotificationNav"
    static let AB_FavNav = "AB_FavNav"
    static let AB_ChatNav = "AB_ChatNav"
    static let AB_TEMPSIDEMENUNav = "AB_TEMPSIDEMENUNav"
    static let AB_ForgetPasswordViewController = "AB_ForgetPasswordViewController"
    static let AB_ImageViewController = "AB_ImageViewController"
    static let AB_FilterViewController = "AB_FilterViewController"
    static let AB_FilteredResultsViewController = "AB_FilteredResultsViewController"
    static let AB_NotificationViewController = "AB_NotificationViewController"
    static let AB_SelectedPropertyDetailsViewController = "AB_SelectedPropertyDetailsViewController"
    static let AB_CalenderEventsViewController = "AB_CalenderEventsViewController"
    static let AB_SettingsViewController = "AB_SettingsViewController"
    static let AB_SettingsNav = "AB_SettingsNav"
    static let AB_ProfileViewController = "AB_ProfileViewController"
    static let AB_ProfileNav = "AB_ProfileNav"
    static let AB_CalenderEventsNav = "AB_CalenderEventsNav"
    static let AB_ContactUsViewController = "AB_ContactUsViewController"
    static let AB_ContactUsNav = "AB_ContactUsNav"
    static let AB_BaseViewController = "AB_BaseViewController"
    static let AB_BaseNav = "AB_BaseNav"
    static let AB_ProfileDetailsEditViewController = "AB_ProfileDetailsEditViewController"
    
}

struct KeyConstants {
    // API response Key
    static let key_token                    = "token"
    static let auth_token                   = "useAuthToken"
    
}

struct ProjectCellIdentifier {
    //App cell Identifiers
    
    static let L_A_Description_TC = "LifeAtAbrajDescriptionTableViewCell"
    static let L_A_Header_TC = "LifeAtAbrajHeadTableViewCell"
    static let L_A_Map_TC = "LifeAtAbrajMapTableViewCell"
    static let L_A_Pager_TC = "LifeAtAbrajPagerViewTableViewCell"
    static let L_A_Share_TC = "LifeAtAbrajShareTableViewCell"
    static let D_B_AB_DocumentsAndBrochures_TC = "AB_DocumentsAndBrochuresTableViewCell"
    
}

struct UserDefault_Key {
    static var LOG_INTO_CONTINUE = "LOG_INTO_CONTINUE"
    static let RESET_TO_CONTINUE = "enteredResetScreen"
    static let AUTH_TOKEN = "useAuthToken"
    static let KEY_TOKEN = "token"
    static let LOGGED_OUT = "logOut"
    static let NOTIFICATION_LOGIN = "notification_bool"
}

// MARK: - Device Parameter

enum UIUserInterfaceIdiom : Int
{
    case Unspecified
    case Phone
    case Pad
}

struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPHONE_X          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 812.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    static let IS_IPAD_PRO          = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
    
    static let DEVICE_ID = UIDevice.current.identifierForVendor!.uuidString
}



import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

  func makeAndPresentAppFromFirstLaunch(silent:Bool = false) {
    
    if !silent { Notify(title: "reboot") }
    
    let vc = ViewController()
    let nvc = UINavigationController(rootViewController: vc)
    window?.rootViewController = nvc
    
  }
  
  func onShake() {
    var x = self
    adg.makeAndPresentAppFromFirstLaunch()
  }
  
  @objc public var window: UIWindow?
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    addInjectionIII()
    
    UNUserNotificationCenter.current().delegate = self
    UNUserNotificationCenter.current().requestAuthorization(options:[.alert,.sound,.badge]) { (granted, error) in }
    
    // let container = NSPersistentContainer(name: "blank")
    
    makeAndPresentAppFromFirstLaunch(silent: true)
    window?.makeKeyAndVisible()
    return true
  }
  
  func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    completionHandler()
  }
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    completionHandler([.badge, .banner])
  }
  
  private func addInjectionIII(){
    #if DEBUG
    Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle")?.load()
    #endif
  }
}

var adg : AppDelegate = {
  return UIApplication.shared.delegate as! AppDelegate
}()

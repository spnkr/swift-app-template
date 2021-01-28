import UIKit

class Notify {
  init(title:String? = nil, subtitle:String? = nil, body:String? = nil, delay:NSNumber = 0.15){
    let centre = UNUserNotificationCenter.current()
    centre.getNotificationSettings { (settings) in
      if settings.authorizationStatus == UNAuthorizationStatus.authorized {
        let content = UNMutableNotificationContent()
        if let it = title {
          content.title = it
        }
        if let it = subtitle {
          content.subtitle = it
        }
        if let it = body {
          content.body = it
        }
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(delay), repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: nil)
      }
    }
  }
  
}

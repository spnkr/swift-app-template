import UIKit


extension Double {
  /// executes on DispatchQueue.main n seconds later
  public func secondsLater(_ work: @escaping @convention(block) () -> Swift.Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + self) {
      work()
    }
  }
}


extension Int {
  /// executes on DispatchQueue.main n seconds later
  public func secondsLater(_ work: @escaping @convention(block) () -> Swift.Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(self)) {
      work()
    }
  }
}


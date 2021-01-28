import UIKit
import SnapKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = [UIColor.systemBlue, UIColor.systemPink, UIColor.systemTeal].randomElement()!
    title = Int.random(in: 1...100).description
    
    let b = UIButton(type: .custom)
    b.setTitle(title, for: .normal)
    b.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.3)
    view.addSubview(b)
    b.snp.makeConstraints({ v in
      v.edges.equalTo(self.view.safeAreaLayoutGuide).inset(15)
    })
    
  }


}


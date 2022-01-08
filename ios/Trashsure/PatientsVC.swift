//
//  PatientsVC.swift
//  Trashsure
//
//  Created by Ferdinand on 08/01/22.
//

import UIKit
import SnapKit

class PatientsVC: UIViewController {
    
    let testButton: UIButton = {
        let button = UIButton()
        button.setTitle("Test", for: .normal)
        button.backgroundColor = .brown
        button.addTarget(self, action: #selector(testButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(testButton)
        testButton.snp.makeConstraints { (make) -> Void in
            make.center.equalToSuperview()
            make.width.height.equalTo(48)
        }
    }
    
    @objc func testButtonTapped(_ sender: Any) {
        self.navigationController?.pushViewController(NotificationVC(), animated: true)
    }
}

class ChatsVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        print("chatsVC Did Load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("chatsVC Will Appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("chatsVC Will Disappear")
    }
}

class NotificationVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        print("notificationVC Did Load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("notificationVC Will Appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("notificationVC Will Disappear")
    }
}



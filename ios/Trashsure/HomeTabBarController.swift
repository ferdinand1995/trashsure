//
//  HomeTabBarController.swift
//  Diabetic Educator
//
//  Created by Ferdinand on 13/08/21.
//

import UIKit
import MaterialComponents
import Alamofire

extension Notification.Name {
    static let isTabBarVisible = Notification.Name("MDCTabBarIsVisible")
}

extension NotificationCenter {
    func addObserver(withUnique observer: Any, selector: Selector, name: Notification.Name, object: Any?) {
        removeObserver(observer, name: name, object: object)
        addObserver(observer, selector: selector, name: name, object: object)
    }
}

class HomeTabBarController: UITabBarController, MDCBottomNavigationBarDelegate {

    lazy var bottomNavigationBar: MDCBottomNavigationBar = {
        let bottomNavigation = MDCBottomNavigationBar(frame: CGRect.zero)
        bottomNavigation.delegate = self
        bottomNavigation.alignment = .justifiedAdjacentTitles
        bottomNavigation.titleVisibility = .selected
        bottomNavigation.selectedItemTintColor = .MAIN_ACTIVE_COLOR
        bottomNavigation.barTintColor = .white
        bottomNavigation.unselectedItemTintColor = .MAIN_PLACEHOLDER_COLOR
        bottomNavigation.sizeToFit()
        return bottomNavigation
    }()
    var observation: NSKeyValueObservation?
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func loadView() {
        super.loadView()
        layoutBottomNavBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initTabContent()
        NotificationCenter.default.addObserver(withUnique: self, selector: #selector(myFunction(_:)), name: .isTabBarVisible, object: nil)
    }

    @objc func myFunction(_ notification: Notification) {
        if let object = notification.object as? Bool {
            setTabBarVisible(visible: object, animated: true)
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(bottomNavigationBar)
        layoutBottomNavBar()
    }

    override func viewSafeAreaInsetsDidChange() {
        if #available(iOS 11.0, *) {
            super.viewSafeAreaInsetsDidChange()
        }
        layoutBottomNavBar()
    }

    private func initTabContent() {

        let patientsVC = PatientsViewController()
        let tabBarPatients = UITabBarItem.init(title: "Pasien", image: UIImage(named: "ic_patient_off")!, tag: 0)
        patientsVC.tabBarItem = tabBarPatients

        let chatsVC = ChatListViewController()
        let tabBarChats = UITabBarItem.init(title: "Obrolan", image: UIImage(named: "ic_chat_off")!, tag: 1)
        chatsVC.tabBarItem = tabBarChats

        let notificationVC = NotificationViewController()
        let tabBarItemNotif = UITabBarItem.init(title: "Pemberitahuan", image: UIImage(named: "ic_notif_on")!, tag: 2)
        notificationVC.tabBarItem = tabBarItemNotif

        bottomNavigationBar.items = [tabBarPatients, tabBarChats, tabBarItemNotif]
        bottomNavigationBar.selectedItem = tabBarPatients
        let viewControllerList = [patientsVC, chatsVC, notificationVC]

        self.viewControllers = viewControllerList.map { return UINavigationController(rootViewController: $0) }
    }

    private func layoutBottomNavBar() {
        let size = bottomNavigationBar.sizeThatFits(view.bounds.size)
        var bottomNavBarFrame = CGRect(x: 0, y: view.bounds.height - size.height, width: view.bounds.width, height: size.height)
        // Extend the Bottom Navigation to the bottom of the screen.
        if #available(iOS 11.0, *) {
            bottomNavBarFrame.size.height += view.safeAreaInsets.bottom
            bottomNavBarFrame.origin.y -= view.safeAreaInsets.bottom
        }
        bottomNavigationBar.frame = bottomNavBarFrame
    }

    func setTabBarVisible(visible: Bool, animated: Bool = true) {

        /** This cannot be called before viewDidLayoutSubviews(), because the frame is not set before this time */
        if (tabBarIsVisible() == visible) { return }
        let frame = self.bottomNavigationBar.frame
        let height = frame.size.height
        let offsetY = (visible ? -height : height)

        let duration: TimeInterval = (animated ? 0.3 : 0.0)

        UIView.animate(withDuration: duration) {
            self.bottomNavigationBar.frame = frame.offsetBy(dx: 0, dy: offsetY)
            return
        }
    }

    func tabBarIsVisible() -> Bool {
        return self.bottomNavigationBar.frame.origin.y < self.view.frame.maxY
    }

    // MARK: MDCBottomNavigationBarDelegate
    func bottomNavigationBar(_ bottomNavigationBar: MDCBottomNavigationBar, didSelect item: UITabBarItem) {
        self.selectedViewController = self.viewControllers![item.tag]
    }
}

//
//  UIViewController+Utils.swift
//  Trashsure
//
//  Created by Ferdinand on 08/01/22.
//

import UIKit

extension UIViewController {

    func add(_ child: UIViewController, frame: CGRect? = nil) {
        addChild(child)
        if frame != nil, let frame = frame {
            child.view.frame = frame
        } else {
            child.view.frame = self.view.frame
        }
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        guard parent != nil else { return }
        willMove(toParent: nil)
        self.view.removeFromSuperview()
        removeFromParent()
    }

    func switchChild(from oldViewController: UIViewController,
                     to newViewController: UIViewController) {
        
        self.add(newViewController)
        newViewController.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.3, animations: {
            newViewController.view.layoutIfNeeded()
        }, completion: { finished in
                oldViewController.remove()
            })
    }
}

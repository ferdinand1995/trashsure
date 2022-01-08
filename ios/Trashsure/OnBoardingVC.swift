//
//  ViewController.swift
//  Trashsure
//
//  Created by Ferdinand on 08/01/22.
//

import UIKit

class OnBoardingVC: UIViewController {
    
    var onBoardView: OnBoardView?

    override func viewDidLoad() {
        super.viewDidLoad()
        onBoardView = OnBoardView(frame: self.view.frame)
        view.addSubview(onBoardView ?? UIView())
        onBoardView?.backgroundView.backgroundColor = UIColor(hex: "#DFEFCA")
        onBoardView?.pageControl.drawer = JumpDrawer(numberOfPages: 3, height: 10, width: 10, space: 8, indicatorColor: UIColor(hex: "#79BCB8"), dotsColor: UIColor(hex: "#7A7A7B"))
    }


}


//
//  OnBoardView.swift
//  Trashsure
//
//  Created by Ferdinand on 08/01/22.
//

import UIKit
import SnapKit

class OnBoardView: UIView {
    let backgroundView = UIView()
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return collectionView
    }()
    
    let skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(UIColor(hex: "#7A7A7B"), for: .normal)
        return button
    }()
    
    var pageControl =  AdvancedPageControlView()
    
    let roundedButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hex: "#79BCB8")
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    private func initUI() {
        addSubview(backgroundView)
        addSubview(collectionView)
        addSubview(skipButton)
        addSubview(pageControl)
        addSubview(roundedButton)
        initLayout()
    }
    
    private func initLayout() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.width.equalTo(112)
            make.height.equalTo(80)
        }
        
        roundedButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-32)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-32)
            make.width.height.equalTo(88)
        }
        
        skipButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-32)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(skipButton.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(roundedButton.snp.top)
        }
    }
}


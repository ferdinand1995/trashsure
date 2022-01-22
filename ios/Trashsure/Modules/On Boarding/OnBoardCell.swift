//
//  OnBoardCell.swift
//  Trashsure
//
//  Created by Ferdinand on 22/01/22.
//

import UIKit
import SnapKit

class OnBoardCell: UICollectionViewCell {

    let contentImageView = UIImageView()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.additionFont(ofSize: 24)
        label.textColor = UIColor(hex: "#16697A")
        label.textAlignment = .center
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.mainFont(ofSize: 14)
        label.textColor = UIColor(hex: "#7A7A7B")
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initCell() {
        contentView.backgroundColor = .clear
        contentView.addSubview(contentImageView)
        contentView.addSubview(titleLabel)
        initLayout()
    }

    private func initLayout() {
        contentImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(432)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentImageView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview()
        }
    }
}

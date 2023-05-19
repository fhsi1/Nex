//
//  statusButtonView.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/20.
//

import Foundation
import UIKit
import SnapKit

class StatusButtonView: UIView {
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "heart"), for: .normal)
        return button
    }()
    
    lazy var countLabel: UILabel = {
        let label = UILabel()
        label.text = "12"
        label.textColor =  UIColor(red: 0.279, green: 0.279, blue: 0.279, alpha: 1)
        label.font = UIFont(name: "Inter-Regular", size: 12)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViews() {
        [
            button,
            countLabel
        ].forEach { addSubview($0) }
        
        button.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
            $0.width.equalTo(16.0)
            $0.height.equalTo(button.snp.width)
        }
        
        countLabel.snp.makeConstraints {
            $0.centerY.equalTo(button.snp.centerY)
            $0.leading.equalTo(button.snp.trailing).offset(6.0)
        }
    }
}

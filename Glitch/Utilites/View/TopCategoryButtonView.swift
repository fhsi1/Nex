//
//  TopCategoryButtonView.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/20.
//

import Foundation
import UIKit
import SnapKit

class TopCategroyButtonView: UIView {
    
    lazy var firstButton: UIButton = {
        let button = UIButton()
        button.setTitle("Profile", for: .normal)
        button.setTitleColor(.nWhite, for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Bold", size: 24)
        return button
    }()
    
    lazy var secondButton: UIButton = {
        let button = UIButton()
        button.setTitle("Contents", for: .normal)
        button.setTitleColor(UIColor(red: 0.342, green: 0.342, blue: 0.342, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Bold", size: 24)
        return button
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
            firstButton,
            secondButton
        ].forEach { addSubview($0) }
        
        firstButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(29.0)
        }
        
        secondButton.snp.makeConstraints {
            $0.centerY.equalTo(firstButton.snp.centerY)
            $0.leading.equalTo(firstButton.snp.trailing).offset(12.0)
            $0.height.equalTo(firstButton.snp.height)
        }
    }
}

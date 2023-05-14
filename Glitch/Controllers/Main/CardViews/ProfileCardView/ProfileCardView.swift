//
//  ProfileCardView.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/14.
//

import Foundation
import UIKit
import SnapKit

class ProfileCardView: UIView {
    
    lazy var backButtonView: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 18.0
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
            backButtonView
        ].forEach { addSubview($0) }
        
        backButtonView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

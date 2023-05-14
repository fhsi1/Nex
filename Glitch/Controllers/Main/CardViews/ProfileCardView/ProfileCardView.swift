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
    
    lazy var ntfView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemYellow
        view.layer.cornerRadius = 100.0
        return view
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
            backButtonView,
            ntfView
        ].forEach { addSubview($0) }
        
        backButtonView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        ntfView.snp.makeConstraints {
            $0.width.equalTo(200.0)
            $0.height.equalTo(ntfView.snp.width)
            $0.top.equalToSuperview().inset(50.0)
            $0.centerX.equalToSuperview()
        }
    }
}

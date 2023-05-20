//
//  InfoView.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/19.
//

import Foundation
import UIKit
import SnapKit

class InfoView: UIView {
    
    private lazy var followerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "운영 커뮤니티"
        label.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        label.font = UIFont(name: "Roboto-Regular", size: 14)
        return label
    }()
    
    lazy var followerLabel: UILabel = {
        let label = UILabel()
        label.text = "12"
        label.textColor = UIColor(red: 0.408, green: 0.408, blue: 0.408, alpha: 1)
        label.font = UIFont(name: "Roboto-Regular", size: 16)
        return label
    }()
    
    lazy var verticalDivider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.946, green: 0.946, blue: 0.946, alpha: 1)
        return view
    }()
    
    private lazy var categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "관심 커뮤니티"
        label.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        label.font = UIFont(name: "Roboto-Regular", size: 14)
        return label
    }()
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "dApp"
        label.textColor = UIColor(red: 0.408, green: 0.408, blue: 0.408, alpha: 1)
        label.font = UIFont(name: "Roboto-Regular", size: 16)
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
            followerTitleLabel,
            followerLabel,
            verticalDivider,
            categoryTitleLabel,
            categoryLabel
        ].forEach { addSubview($0) }
        
        followerTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        followerLabel.snp.makeConstraints {
            $0.centerX.equalTo(followerTitleLabel.snp.centerX)
            $0.top.equalTo(followerTitleLabel.snp.bottom).offset(6.0)
        }
        
        verticalDivider.snp.makeConstraints {
            $0.top.equalTo(followerTitleLabel.snp.top)
            $0.width.equalTo(1.0)
            $0.bottom.equalTo(followerLabel.snp.bottom)
            $0.leading.equalTo(followerTitleLabel.snp.trailing).offset(32.0)
        }
        
        categoryTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(verticalDivider.snp.trailing).offset(32.0)
            $0.top.equalTo(verticalDivider.snp.top)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.centerX.equalTo(categoryTitleLabel.snp.centerX)
            $0.top.equalTo(categoryTitleLabel.snp.bottom).offset(6.0)
        }
    }
}

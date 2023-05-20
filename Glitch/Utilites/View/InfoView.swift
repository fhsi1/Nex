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
    
    private lazy var communitesTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "My Communities"
        label.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        label.font = UIFont(name: "Roboto-Regular", size: 14)
        return label
    }()
    
    lazy var communitiesLabel: UILabel = {
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
    
    private lazy var joinedCommunitiesTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Joined Communites"
        label.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        label.font = UIFont(name: "Roboto-Regular", size: 14)
        return label
    }()
    
    lazy var joinedCommunitiesLabel: UILabel = {
        let label = UILabel()
        label.text = "1,003"
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
            communitesTitleLabel,
            communitiesLabel,
            verticalDivider,
            joinedCommunitiesTitleLabel,
            joinedCommunitiesLabel
        ].forEach { addSubview($0) }
        
        communitesTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        communitiesLabel.snp.makeConstraints {
            $0.centerX.equalTo(communitesTitleLabel.snp.centerX)
            $0.top.equalTo(communitesTitleLabel.snp.bottom).offset(6.0)
        }
        
        verticalDivider.snp.makeConstraints {
            $0.top.equalTo(communitesTitleLabel.snp.top)
            $0.width.equalTo(1.0)
            $0.bottom.equalTo(communitiesLabel.snp.bottom)
            $0.leading.equalTo(communitesTitleLabel.snp.trailing).offset(16.0)
        }
        
        joinedCommunitiesTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(verticalDivider.snp.trailing).offset(16.0)
            $0.top.equalTo(verticalDivider.snp.top)
        }
        
        joinedCommunitiesLabel.snp.makeConstraints {
            $0.centerX.equalTo(joinedCommunitiesTitleLabel.snp.centerX)
            $0.top.equalTo(joinedCommunitiesTitleLabel.snp.bottom).offset(6.0)
        }
    }
}

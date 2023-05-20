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
        button.backgroundColor = .nWhite
        button.layer.cornerRadius = 18.0
        return button
    }()
    
    lazy var nftView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 9.74
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1.0
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nina Dobrev"
        label.font = UIFont(name: "Roboto-Bold", size: 28)
        label.textColor = .ntitle
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "블록체인 세상에 관심이 많은 Nina Dobrev"
        label.textColor = UIColor(red: 0.688, green: 0.688, blue: 0.688, alpha: 1)
        label.font = UIFont(name: "Roboto-Regular", size: 14)
        return label
    }()
    
    lazy var horizontalDivider: DashedLineView = {
        let view = DashedLineView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var dot1: halfCircleLeftView = {
        let view = halfCircleLeftView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var dot2: halfCircleRightView = {
        let view = halfCircleRightView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var infoView: InfoView = {
        let view = InfoView()
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
            nftView,
            nameLabel,
            descriptionLabel,
            horizontalDivider,
            dot1,
            dot2,
            infoView
        ].forEach { addSubview($0) }
        
        backButtonView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        nftView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12.0)
            $0.top.equalToSuperview().inset(12.0)
            $0.trailing.equalToSuperview().inset(12.0)
            $0.height.equalTo(nftView.snp.width)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20.0)
            $0.top.equalTo(nftView.snp.bottom).offset(24.0)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.top.equalTo(nameLabel.snp.bottom).offset(12.0)
        }
        
        horizontalDivider.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(1.0)
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(49.68)
        }
        dot1.snp.makeConstraints {
            $0.width.equalTo(24.0)
            $0.height.equalTo(24.0)
            $0.centerY.equalTo(horizontalDivider.snp.centerY)
            $0.trailing.equalTo(horizontalDivider.snp.leading).inset(12.0)
        }
        
        dot2.snp.makeConstraints {
            $0.width.equalTo(24.0)
            $0.height.equalTo(24.0)
            $0.trailing.equalTo(horizontalDivider.snp.trailing).offset(12.0)
            $0.centerY.equalTo(horizontalDivider.snp.centerY)
        }
        
        infoView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(28.0)
            $0.trailing.equalToSuperview().inset(28.0)
            $0.top.equalTo(horizontalDivider.snp.bottom).offset(27.32)
            
        }
    }
}

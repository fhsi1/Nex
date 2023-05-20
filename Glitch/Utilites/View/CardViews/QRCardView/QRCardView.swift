//
//  QRCardView.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/14.
//

import Foundation
import UIKit
import SnapKit

class QRCardView: UIView {
    
    lazy var backButtonView: UIButton = {
        let button = UIButton()
        button.backgroundColor = .nWhite
        button.layer.cornerRadius = 18.0
        return button
    }()
    
    lazy var qrView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 18.0
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nex님"
        label.font = UIFont(name: "Roboto-Bold", size: 28)
        label.textColor = .ntitle
        return label
    }()
    
    lazy var editProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 편집", for: .normal)
        button.setTitleColor(UIColor(red: 0.467, green: 0.467, blue: 0.467, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.958, alpha: 1)
        button.layer.cornerRadius = 13.0
        button.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 11)
        return button
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "안녕하세요"
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
            qrView,
            nameLabel,
            editProfileButton,
            descriptionLabel,
            horizontalDivider,
            dot1,
            dot2,
            infoView
        ].forEach { addSubview($0) }
        
        backButtonView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        qrView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(17.65)
            $0.leading.equalToSuperview().inset(17.65)
            $0.trailing.equalToSuperview().inset(17.65)
            $0.height.equalTo(qrView.snp.width)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(qrView.snp.leading)
            $0.top.equalTo(qrView.snp.bottom).offset(24.0)
        }
        
        editProfileButton.snp.makeConstraints {
            $0.centerY.equalTo(nameLabel.snp.centerY)
            $0.leading.equalTo(nameLabel.snp.trailing).offset(4.0)
            $0.height.equalTo(27.0)
            $0.width.equalTo(77.0)
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
            $0.leading.equalToSuperview().inset(40.0)
            $0.trailing.equalToSuperview().inset(40.0)
            $0.top.equalTo(horizontalDivider.snp.bottom).offset(27.32)
        }
    }
}

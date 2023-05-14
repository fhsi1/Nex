//
//  CompleteAlertView.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/14.
//

import Foundation
import UIKit
import SnapKit

class CompleteAlertView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "이벤트 참여 완료"
        return label
    }()
    
    lazy var okButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 18.0
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViews() {
        [
            titleLabel,
            okButton
        ].forEach { addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(24.0)
        }
        
        okButton.snp.makeConstraints {
            $0.centerX.equalTo(titleLabel.snp.centerX)
            $0.top.equalTo(titleLabel.snp.bottom).offset(24.0)
            $0.width.equalTo(72.0)
        }
    }
}

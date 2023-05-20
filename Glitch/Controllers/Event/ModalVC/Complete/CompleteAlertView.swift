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
        label.text = "이벤트 참여 안내"
        label.textColor = .nWhite
        label.font = UIFont(name: "Roboto-Bold", size: 14)
        return label
    }()
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.text  = """
        KewlPass NFT
        이벤트 참여가 완료되었습니다.
        """
        label.textColor = .nWhite
        label.font = UIFont(name: "Roboto-Regular", size: 13)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .nBlack
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViews() {
        [
            titleLabel,
            contentLabel
        ].forEach { addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        contentLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.top.equalTo(titleLabel.snp.bottom).offset(18.0)
        }
    }
}

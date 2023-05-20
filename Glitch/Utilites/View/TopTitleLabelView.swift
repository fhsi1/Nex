//
//  TopTitleLabelView.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/20.
//

import Foundation
import UIKit
import SnapKit

class TopTitleLabelView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Event"
        label.textColor = .nWhite
        label.font = UIFont(name: "Inter-Bold", size: 24)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(29.0)
        }
    }
}

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
        button.backgroundColor = UIColor(red: 0.07, green: 0.00, blue: 0.47, alpha: 1.00)
        button.layer.cornerRadius = 18.0
        return button
    }()
    
    lazy var qrView: UIImageView = {
        let view = UIImageView()
//        view.backgroundColor = .systemPurple
        view.layer.cornerRadius = 18.0
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
            qrView
        ].forEach { addSubview($0) }
        
        backButtonView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        qrView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(50.0)
            $0.width.equalTo(230.0)
            $0.height.equalTo(qrView.snp.width)
        }
    }
}


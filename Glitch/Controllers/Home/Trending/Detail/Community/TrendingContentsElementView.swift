//
//  TrendingContentsElementView.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/20.
//

import Foundation
import UIKit
import SnapKit

class TrendingContentsElementView: UIView {
    lazy var logoView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "DummyLogo")
        view.layer.cornerRadius = 8.0
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Ronin"
        label.textColor = UIColor(red: 0.917, green: 0.917, blue: 0.917, alpha: 1)
        label.font = UIFont(name: "Inter-Bold", size: 16)
        return label
    }()
    
    lazy var countLabel: UILabel = {
        let label = UILabel()
        label.text = "1 Quests"
        label.textColor = UIColor(red: 0.917, green: 0.917, blue: 0.917, alpha: 1)
        label.font = UIFont(name: "Inter-Regular", size: 11)
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
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            countLabel
        ])
        
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 1.0
        
        [
            logoView,
            stackView
        ].forEach { addSubview($0) }
        
        logoView.snp.makeConstraints {
            $0.width.equalTo(44.0)
            $0.height.equalTo(logoView.snp.width)
            $0.top.equalToSuperview().inset(12.0)
            $0.leading.equalToSuperview().inset(12.0)
        }
        
        stackView.snp.makeConstraints {
            $0.leading.equalTo(logoView.snp.trailing).offset(12.0)
            $0.centerY.equalTo(logoView.snp.centerY)
        }
    }
}

//
//  TrendingContentsTitleButton.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/20.
//

import Foundation
import UIKit
import SnapKit

class TrendingContentsTitleButton: UIView {
    
    lazy var button: UIButton = {
        let button = UIButton()
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "관심 커뮤니티"
        label.textColor = .nWhite
        label.font = UIFont(name: "Inter-Bold", size: 18)
        return label
    }()
    
    lazy var arrowView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "arrow")
        return view
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
        [
            button,
            titleLabel,
            arrowView
        ].forEach { addSubview($0) }
        
        button.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20.0)
            $0.top.equalToSuperview().inset(5.0)
        }
        
        arrowView.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.height.equalTo(32.0)
            $0.width.equalTo(arrowView.snp.height)
        }
    }
}

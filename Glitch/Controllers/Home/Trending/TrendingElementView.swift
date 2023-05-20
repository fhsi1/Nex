//
//  TrendingElementView.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/20.
//

import Foundation
import UIKit
import SnapKit

class TrendingElementView: UIView {
    
    lazy var logoView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 4.0
        view.image = UIImage(named: "DummyLogo")
        view.clipsToBounds = true
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Ronin"
        label.textColor = UIColor(red: 0.92, green: 0.92, blue: 0.92, alpha: 1.00)
        label.font = UIFont(name: "Inter-Bold", size: 16)
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2023.05.19"
        label.textColor = UIColor(red: 0.92, green: 0.92, blue: 0.92, alpha: 1.00)
        label.font = UIFont(name: "Inter-Regular", size: 11)
        return label
    }()
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.text = """
        No more data theft!
        your data = your icome 🤑 
        #HUDltoken is LIVE ON #BNBchain

        CONTRACT:
        1edwq09w3980129813hd9102910293sdasd092
        #PancakeSwap
        """
        label.textColor = .nWhite
        label.numberOfLines = 0
        label.font = UIFont(name: "Inter-Regular", size: 12)
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 8.0
        view.backgroundColor = .systemBlue
        return view
    }()
    
    lazy var heartView: StatusButtonView = {
        let view = StatusButtonView()
        return view
    }()
    
    lazy var commentView: StatusButtonView = {
        let view = StatusButtonView()
        view.button.setImage(UIImage(named: "comment"), for: .normal)
        view.countLabel.text = "12"
        return view
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
            dateLabel
        ])
        
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 1.0
        
        [
            logoView,
            stackView,
            contentLabel,
            imageView,
            heartView,
            commentView
        ].forEach { addSubview($0) }
        
        logoView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16.0)
            $0.top.equalToSuperview().inset(16.0)
            $0.width.equalTo(38.0)
            $0.height.equalTo(logoView.snp.width)
        }
        
        stackView.snp.makeConstraints {
            $0.leading.equalTo(logoView.snp.trailing).offset(8.0)
            $0.centerY.equalTo(logoView.snp.centerY)
        }
        
        contentLabel.snp.makeConstraints {
            $0.leading.equalTo(logoView.snp.leading)
            $0.top.equalTo(logoView.snp.bottom).offset(12.0)
            $0.trailing.equalToSuperview().inset(16.0)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(20.0)
            $0.leading.equalTo(contentLabel.snp.leading)
            $0.trailing.equalTo(contentLabel.snp.trailing)
            $0.height.equalTo(170.0)
        }
        
        heartView.snp.makeConstraints {
            $0.leading.equalTo(contentLabel.snp.leading)
            $0.height.equalTo(16.0)
            $0.top.equalTo(imageView.snp.bottom).offset(20.0)
            $0.width.equalTo(37.34)
        }
        
        commentView.snp.makeConstraints {
            $0.centerY.equalTo(heartView.snp.centerY)
            $0.leading.equalTo(heartView.snp.trailing).offset(24.0)
            $0.height.equalTo(heartView.snp.height)
            $0.width.equalTo(heartView.snp.width)
        }
    }
}

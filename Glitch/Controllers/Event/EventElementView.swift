//
//  EventElementView.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/20.
//

import Foundation
import UIKit
import SnapKit

class EventElementView: UIView {
    lazy var logoView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "benqi")
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TaskFi AI Protocol TaskFi AIWe..."
        label.textColor = .nWhite
        label.font = UIFont(name: "Inter-Bold", size: 16)
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2023.05.18~2023.06.18"
        label.textColor = .nWhite
        label.font = UIFont(name: "Inter-Regular", size: 11)
        return label
    }()
    
    private lazy var divider: UIView = {
        let label = UILabel()
        label.backgroundColor = UIColor(red: 0.342, green: 0.342, blue: 0.342, alpha: 1)
        return label
    }()
    
    lazy var viewCntLabel: UILabel = {
        let label = UILabel()
        label.text = "View 2,300"
        label.textColor = .nWhite
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
            dateLabel
        ])
        
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 2.0
        
        [
            logoView,
            stackView,
            divider,
            viewCntLabel
        ].forEach { addSubview($0) }
        
        logoView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12.0)
            $0.top.equalToSuperview().inset(12.0)
            $0.width.equalTo(44.0)
            $0.height.equalTo(logoView.snp.width)
        }
        
        stackView.snp.makeConstraints {
            $0.leading.equalTo(logoView.snp.trailing).offset(12.0)
            $0.centerY.equalTo(logoView.snp.centerY)
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.top)
            $0.bottom.equalTo(dateLabel.snp.bottom)
            $0.width.equalTo(1.0)
            $0.leading.equalTo(dateLabel.snp.trailing).offset(4.0)
        }
        
        viewCntLabel.snp.makeConstraints {
            $0.leading.equalTo(divider.snp.trailing).offset(4.0)
            $0.centerY.equalTo(divider.snp.centerY)
        }
    }
}

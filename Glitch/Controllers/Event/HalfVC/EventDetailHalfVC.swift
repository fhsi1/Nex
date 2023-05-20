//
//  EventDetailHalfVC.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/20.
//

import Foundation
import UIKit
import SnapKit

class EventDetailHalfVC: UIViewController {
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "close"), for: .normal)
        button.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        return button
    }()
    
    lazy var logoView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "benqi")
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "benqi.fi"
        label.textColor = .nWhite
        label.font = UIFont(name: "Inter-Bold", size: 24)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Stake AVAXX and receive
        sAVAX to unlock your capital
        """
        label.textColor = .nWhite
        label.font = UIFont(name: "Inter-Regular", size: 14)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var actionButton: UIButton = {
        let button = UIButton()
        button.setTitle("View event", for: .normal)
        button.setTitleColor(.nWhite, for: .normal)
        button.backgroundColor = .nPurple
        button.layer.cornerRadius = 8.0
        return button
    }()
    
    @objc func tappedCloseButton() {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .nBlack
        
        setupViews()
    }
    
    private func setupViews() {
        [
            closeButton,
            logoView,
            titleLabel,
            descriptionLabel,
            actionButton
        ].forEach { view.addSubview($0) }
        
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
        }
        
        logoView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(80.0)
            $0.height.equalTo(logoView.snp.width)
            $0.top.equalToSuperview().inset(60.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalTo(logoView.snp.centerX)
            $0.top.equalTo(logoView.snp.bottom).offset(20.0)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerX.equalTo(titleLabel.snp.centerX)
            $0.top.equalTo(titleLabel.snp.bottom).offset(10.0)
        }
        
        actionButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24.0)
            $0.trailing.equalToSuperview().inset(24.0)
            $0.height.equalTo(48.0)
            $0.bottom.equalToSuperview().inset(40.0)
        }
    }
}

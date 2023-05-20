//
//  CompleteEventVC.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/14.
//

import Foundation
import UIKit

class CompleteEventVC: UIViewController {
    
    lazy var alertBackView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 18.0
        view.backgroundColor = .nBlack
        return view
    }()
    
    lazy var alertView: CompleteAlertView = {
        let view = CompleteAlertView()
        view.layer.cornerRadius = 18.0
        return view
    }()
    
    private lazy var verticalDivider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.125, green: 0.129, blue: 0.141, alpha: 1)
        return view
    }()
    
    lazy var okButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.nPurple, for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 13)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.61, green: 0.64, blue: 0.71, alpha: 0.60)
        
        setupViews()
    }
    
    private func setupViews() {
        [
            alertBackView,
            alertView,
            verticalDivider,
            okButton
        ].forEach { view.addSubview($0) }
        
        alertBackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(174.0)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(272.0)
        }
        
        alertView.snp.makeConstraints {
            $0.top.equalTo(alertBackView.snp.top).inset(22.0)
            $0.leading.equalTo(alertBackView.snp.leading).inset(24.0)
        }
        
        verticalDivider.snp.makeConstraints {
            $0.leading.equalTo(alertBackView.snp.leading)
            $0.trailing.equalTo(alertBackView.snp.trailing)
            $0.height.equalTo(1.0)
            $0.bottom.equalTo(alertBackView.snp.bottom).inset(53.0)
        }
        
        okButton.snp.makeConstraints {
            $0.top.equalTo(verticalDivider.snp.bottom)
            $0.height.equalTo(53.0)
            $0.leading.equalTo(verticalDivider.snp.leading)
            $0.trailing.equalTo(verticalDivider.snp.trailing)
        }
    }
}

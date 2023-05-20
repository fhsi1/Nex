//
//  UpdateNFTVC.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/20.
//

import Foundation
import UIKit
import SnapKit
import Lottie

class UpdateNFTVC: UIViewController {
    lazy var alertBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .nBlack
        view.layer.cornerRadius = 10.0
        return view
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "close"), for: .normal)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Nex님,
        새로운 NFT를 받았어요!
        """
        label.textColor = .nWhite
        label.font = UIFont(name: "Roboto-Bold", size: 22)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var animationView: LottieAnimationView = {
        let view = LottieAnimationView(name: "party")
        return view
    }()
    
    lazy var nftView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "NFT3")
        view.layer.cornerRadius = 18.0
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.61, green: 0.64, blue: 0.71, alpha: 0.60)
        
        setupViews()
        
        animationView.play()
    }
    
    private func setupViews() {
        [
            alertBackView,
            closeButton,
            titleLabel,
            animationView,
            nftView
        ].forEach { view.addSubview($0) }
        
        alertBackView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(29.0)
            $0.trailing.equalToSuperview().inset(29.0)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(400.0)
        }
        
        closeButton.snp.makeConstraints {
            $0.top.equalTo(alertBackView.snp.top).inset(20.0)
            $0.trailing.equalTo(alertBackView.snp.trailing).inset(20.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(alertBackView.snp.top).inset(63.0)
            $0.centerX.equalTo(alertBackView.snp.centerX)
        }
        
        animationView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(375.0)
            $0.height.equalTo(375.0)
        }
        
        nftView.snp.makeConstraints {
            $0.width.equalTo(160.0)
            $0.height.equalTo(160.0)
            $0.top.equalTo(titleLabel.snp.bottom).offset(42.0)
            $0.centerX.equalTo(titleLabel.snp.centerX)
        }
    }
}

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
import KeychainSwift
import Kingfisher

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
        button.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Nex,
        You got the NEXt NFT!
        """
        label.textColor = .nWhite
        label.font = UIFont(name: "Roboto-Bold", size: 22)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        let attirbutedString = NSMutableAttributedString(string: label.text!)
        let range = (label.text! as NSString).range(of: "NEX")
        attirbutedString.addAttribute(.foregroundColor, value: UIColor.nPurple!, range: range)
        
        label.attributedText = attirbutedString
        
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
    
    @objc func tappedCloseButton() {
        let mainViewController = TabBarVC()
        
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        guard let delegate = sceneDelegate else { return }
        delegate.window?.rootViewController = mainViewController
        
        mainViewController.selectedIndex = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.3)
        
        setupViews()
        
        animationView.play()
        
        guard let url = URL(string: KeychainSwift().get("externalURL") ?? "") else { return }

        nftView.kf.setImage(with: url)
        
        if let status = KeychainSwift().get("status") {
            if status == "1" {
                nftView.image = UIImage(named: "NFT3")
            }
        }
    }
    
    private func setupViews() {
        [
            alertBackView,
            titleLabel,
            animationView,
            closeButton,
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
            $0.height.equalTo(24.0)
            $0.width.equalTo(closeButton.snp.height)
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

//
//  ProfileVC.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/20.
//

import Foundation
import UIKit
import SnapKit

class ProfileVC: UIViewController {
    
    private lazy var backView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "BackView")
        return view
    }()
    
    lazy var cardView: CardView = {
        let view = CardView()
        
        [
            view.profileCardView.backButtonView,
            view.qrCardView.backButtonView
        ].forEach { $0.addTarget(self, action: #selector(flip), for: .touchUpInside) }
        
        view.profileCardView.nameLabel.text = "Nex"
        view.profileCardView.descriptionLabel.text = "Web3 Sufer"
        
        view.qrCardView.nameLabel.text = "Nex"
        view.qrCardView.descriptionLabel.text = "Web3 Sufer"
        
        view.profileCardView.nftView.image = UIImage(named: "NFT3")
        view.qrCardView.qrView.image = UIImage(named: "DummyQR")
        
        return view
    }()
    
    lazy var editProfileButton1: UIButton = {
        let button = UIButton()
        button.setTitle("Edit Profile", for: .normal)
        button.setTitleColor(UIColor(red: 0.467, green: 0.467, blue: 0.467, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.958, alpha: 1)
        button.layer.cornerRadius = 13.0
        button.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 11)
        return button
    }()
    
    lazy var editProfileButton2: UIButton = {
        let button = UIButton()
        button.setTitle("Edit Profile", for: .normal)
        button.setTitleColor(UIColor(red: 0.467, green: 0.467, blue: 0.467, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.958, alpha: 1)
        button.layer.cornerRadius = 13.0
        button.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 11)
        return button
    }()
    
    @objc func flip(_ sender: CardView) {
        let transitionOptions: UIView.AnimationOptions = [
            .transitionFlipFromRight,
            .showHideTransitionViews
        ]
        
        if sender == cardView.profileCardView.backButtonView {
            UIView.transition(
                with: cardView,
                duration: 0.5,
                options: transitionOptions,
                animations: {
                    self.cardView.profileCardView.isHidden = true
                    self.cardView.qrCardView.isHidden = false
            })
        } else {
            UIView.transition(
                with: cardView,
                duration: 0.5,
                options: transitionOptions,
                animations: {
                    self.cardView.profileCardView.isHidden = false
                    self.cardView.qrCardView.isHidden = true
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        
        setupViews()
    }
    
    private func setupViews() {
        [
            backView,
            cardView
        ].forEach { view.addSubview($0) }
        
        cardView.profileCardView.addSubview(editProfileButton1)
        cardView.qrCardView.addSubview(editProfileButton2)
        
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        cardView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(32.0)
            $0.trailing.equalToSuperview().inset(31.0)
            $0.height.equalTo(540.0)
            $0.top.equalToSuperview().inset(32.0)
        }
        
        editProfileButton1.snp.makeConstraints {
            $0.centerY.equalTo(cardView.profileCardView.nameLabel.snp.centerY)
            $0.leading.equalTo(cardView.profileCardView.nameLabel.snp.trailing).offset(4.0)
            $0.height.equalTo(27.0)
            $0.width.equalTo(75.0)
        }
        
        editProfileButton2.snp.makeConstraints {
            $0.centerY.equalTo(cardView.qrCardView.nameLabel.snp.centerY)
            $0.leading.equalTo(cardView.qrCardView.nameLabel.snp.trailing).offset(4.0)
            $0.height.equalTo(27.0)
            $0.width.equalTo(75.0)
        }
    }
}

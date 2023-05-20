//
//  TrendingProfileView.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/20.
//

import Foundation
import UIKit
import SnapKit

class TrendingProfileView: UIView {
    lazy var cardView: CardView = {
        let view = CardView()
        
        [
            view.profileCardView.backButtonView,
            view.qrCardView.backButtonView
        ].forEach { $0.addTarget(self, action: #selector(flip), for: .touchUpInside) }
        
        return view
    }()
    
    lazy var contactButton1: UIButton = {
        let button = UIButton()
        button.setTitle("Message", for: .normal)
        button.setTitleColor(.nWhite, for: .normal)
        button.backgroundColor = UIColor(red: 0.708, green: 0.708, blue: 0.708, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 11)
        button.layer.cornerRadius = 15.0
        return button
    }()
    
    lazy var contactButton2: UIButton = {
        let button = UIButton()
        button.setTitle("Message", for: .normal)
        button.setTitleColor(.nWhite, for: .normal)
        button.backgroundColor = UIColor(red: 0.708, green: 0.708, blue: 0.708, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 11)
        button.layer.cornerRadius = 15.0
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViews() {
        [
            cardView
        ].forEach { addSubview($0) }
        
        cardView.profileCardView.addSubview(contactButton1)
        cardView.qrCardView.addSubview(contactButton2)
        
        cardView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(32.0)
            $0.trailing.equalToSuperview().inset(31.0)
            $0.height.equalTo(540.0)
            $0.top.equalToSuperview().inset(70.0)
        }
        
        contactButton1.snp.makeConstraints {
            $0.centerY.equalTo(cardView.profileCardView.nameLabel.snp.centerY)
            $0.trailing.equalTo(cardView.profileCardView.snp.trailing).inset(20.0)
            $0.width.equalTo(68.0)
            $0.height.equalTo(27.0)
        }
        
        contactButton2.snp.makeConstraints {
            $0.centerY.equalTo(cardView.qrCardView.nameLabel.snp.centerY)
            $0.trailing.equalTo(cardView.qrCardView.snp.trailing).inset(20.0)
            $0.width.equalTo(68.0)
            $0.height.equalTo(27.0)
        }
    }
}

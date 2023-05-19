//
//  MainVC.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/13.
//

import Foundation
import UIKit
import SnapKit

class MainVC: UIViewController {
    
    lazy var cardView: CardView = {
        let view = CardView()
        
        [
            view.profileCardView.backButtonView,
            view.qrCardView.backButtonView
        ].forEach { $0.addTarget(self, action: #selector(flip), for: .touchUpInside) }
        
        return view
    }()
    
    @objc func flip(_ sender: CardView) {
        let transitionOptions: UIView.AnimationOptions = [
            .transitionFlipFromRight,
            .showHideTransitionViews
        ]
        
        if sender == cardView.profileCardView.backButtonView {
            UIView.transition(
                with: cardView,
                duration: 1.0,
                options: transitionOptions,
                animations: {
                    self.cardView.profileCardView.isHidden = true
                    self.cardView.qrCardView.isHidden = false
            })
        } else {
            UIView.transition(
                with: cardView,
                duration: 1.0,
                options: transitionOptions,
                animations: {
                    self.cardView.profileCardView.isHidden = false
                    self.cardView.qrCardView.isHidden = true
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .nDarkBlack
        
        setupViews()
        bindData()
    }
    
    private func setupViews() {
        [
            cardView
        ].forEach { view.addSubview($0) }
        
        cardView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(32.0)
            $0.trailing.equalToSuperview().inset(31.0)
            $0.height.equalTo(540.0)
            $0.centerY.equalToSuperview()
        }
    }
}

extension MainVC {
    func bindData() {
        cardView.profileCardView.nftView.image = UIImage(named: "DummyNFT")
        cardView.qrCardView.qrView.image = UIImage(named: "DummyQR")
    }
}

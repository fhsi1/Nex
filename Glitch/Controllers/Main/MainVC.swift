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
        
        setupViews()
        bindData()
    }
    
    private func setupViews() {
        [
            cardView
        ].forEach { view.addSubview($0) }
        
        cardView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(450.0)
            $0.width.equalTo(300.0)
        }
    }
}

extension MainVC {
    func bindData() {
        cardView.profileCardView.ntfView.image = UIImage(named: "ProfileDummy")
        cardView.qrCardView.qrView.image = UIImage(named: "QRDummy")
    }
}

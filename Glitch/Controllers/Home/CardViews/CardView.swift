//
//  CardView.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/14.
//

import Foundation
import UIKit

class CardView: UIView {
    lazy var profileCardView: ProfileCardView = {
        let view = ProfileCardView()
        return view
    }()
    
    lazy var qrCardView: QRCardView = {
        let view = QRCardView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViews() {
        [
            qrCardView,
            profileCardView,
        ].forEach { addSubview($0) }
        
        qrCardView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        profileCardView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

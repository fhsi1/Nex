//
//  TopCategoryButtonView.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/20.
//

import Foundation
import UIKit
import SnapKit

class TopCategroyButtonView: UIView {
    
    lazy var firstButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    lazy var secondButton: UIButton = {
        let button = UIButton()
        return button
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
            firstButton,
            secondButton
        ].forEach { addSubview($0) }
    }
}

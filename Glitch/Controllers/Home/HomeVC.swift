//
//  MainVC.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/13.
//

import Foundation
import UIKit
import SnapKit

class HomeVC: UIViewController {
    
    private lazy var backView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "BackView")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .nDarkBlack
        
        setupViews()
    }
    
    private func setupViews() {
        [
            backView,
            
        ].forEach { view.addSubview($0) }
        
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
}

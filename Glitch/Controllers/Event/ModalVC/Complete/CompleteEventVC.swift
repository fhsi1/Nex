//
//  CompleteEventVC.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/14.
//

import Foundation
import UIKit

class CompleteEventVC: UIViewController {
    
    lazy var alertView: CompleteAlertView = {
        let view = CompleteAlertView()
        view.layer.cornerRadius = 18.0
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.61, green: 0.64, blue: 0.71, alpha: 0.60)
        
        setupViews()
    }
    
    private func setupViews() {
        [
            alertView
        ].forEach { view.addSubview($0) }
        
        alertView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(120.0)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(250.0)
        }
    }
}

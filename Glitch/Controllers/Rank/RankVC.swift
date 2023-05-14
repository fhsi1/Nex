//
//  RankVC.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/13.
//

import Foundation
import UIKit

class RankVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupViews()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "순위"
    }
    
    private func setupViews() {
        [
            
        ].forEach { view.addSubview($0) }
    }
}

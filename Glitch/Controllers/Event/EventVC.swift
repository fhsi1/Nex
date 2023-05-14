//
//  EventVC.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/13.
//

import Foundation
import UIKit

class EventVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupViews()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "이벤트"
    }
    
    private func setupViews() {
        [
            
        ].forEach { view.addSubview($0) }
    }
}

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
    
    lazy var titleButtonView: TopCategroyButtonView = {
        let button = TopCategroyButtonView()
        button.firstButton.setTitle("Trending", for: .normal)
        button.secondButton.setTitle("Community", for: .normal)
        button.firstButton.addTarget(self, action: #selector(tappedProfileButton), for: .touchUpInside)
        button.secondButton.addTarget(self, action: #selector(tappedContentsButton), for: .touchUpInside)
        return button
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    lazy var trendingVC: TrendingVC = {
        let vc = TrendingVC()
        vc.tableView.delegate = self
        return vc
    }()
    
    @objc func tappedProfileButton() {
        print("tappedProfileButton")
        titleButtonView.firstButton.setTitleColor(.nWhite, for: .normal)
        titleButtonView.secondButton.setTitleColor(UIColor(red: 0.342, green: 0.342, blue: 0.342, alpha: 1), for: .normal)
    }
    
    @objc func tappedContentsButton() {
        print("tappedContentsButton")
        titleButtonView.firstButton.setTitleColor(UIColor(red: 0.342, green: 0.342, blue: 0.342, alpha: 1), for: .normal)
        titleButtonView.secondButton.setTitleColor(.nWhite, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .nDarkBlack
        
        setupNavigationBar()
        setupViews()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupViews() {
        
        addChild(trendingVC)
        trendingVC.view.frame = contentView.frame
        contentView.addSubview(trendingVC.view)
        trendingVC.didMove(toParent: self)
        
        [
            backView,
            titleButtonView,
            contentView
        ].forEach { view.addSubview($0) }
        
        
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleButtonView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(57.0)
            $0.leading.equalToSuperview().inset(24.0)
            $0.height.equalTo(29.0)
            $0.trailing.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.top.equalTo(titleButtonView.snp.bottom).offset(14.0)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TrendingDetailVC()
        
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = true
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

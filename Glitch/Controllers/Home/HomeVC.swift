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
        button.firstButton.addTarget(self, action: #selector(tappedTrendingButton), for: .touchUpInside)
        button.secondButton.addTarget(self, action: #selector(tappedCommunityButton), for: .touchUpInside)
        return button
    }()
    
    lazy var contentView1: UIView = {
        let view = UIView()
        view.isHidden = false
        return view
    }()
    
    lazy var contentView2: UIView = {
        let view = UIView()
        view.isHidden = true
        return view
    }()
    
    lazy var trendingVC: TrendingVC = {
        let vc = TrendingVC()
        
        vc.tableView.register(TrendingTableViewCell.self, forCellReuseIdentifier: "TrendingTableViewCell")
        
        vc.tableView.dataSource = self
        vc.tableView.delegate = self
        return vc
    }()
    
    lazy var cummunityVC: TrendingVC = {
        let vc = TrendingVC()
        
        vc.tableView.register(TrendingTableViewCell.self, forCellReuseIdentifier: "TrendingTableViewCell")
        
        vc.tableView.dataSource = self
        vc.tableView.delegate = self
        return vc
    }()
    
    @objc func tappedTrendingButton() {
        titleButtonView.firstButton.setTitleColor(.nWhite, for: .normal)
        titleButtonView.secondButton.setTitleColor(UIColor(red: 0.342, green: 0.342, blue: 0.342, alpha: 1), for: .normal)
        
        contentView1.isHidden = false
        contentView2.isHidden = true
    }
    
    @objc func tappedCommunityButton() {
        titleButtonView.firstButton.setTitleColor(UIColor(red: 0.342, green: 0.342, blue: 0.342, alpha: 1), for: .normal)
        titleButtonView.secondButton.setTitleColor(.nWhite, for: .normal)
        
        contentView2.isHidden = false
        contentView1.isHidden = true
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
        trendingVC.view.frame = contentView1.frame
        contentView1.addSubview(trendingVC.view)
        trendingVC.didMove(toParent: self)
        
        addChild(cummunityVC)
        cummunityVC.view.frame = contentView2.frame
        contentView2.addSubview(cummunityVC.view)
        cummunityVC.didMove(toParent: self)
        
        [
            backView,
            titleButtonView,
            contentView1,
            contentView2
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
        
        contentView1.snp.makeConstraints {
            $0.top.equalTo(titleButtonView.snp.bottom).offset(14.0)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        contentView2.snp.makeConstraints {
            $0.top.equalTo(titleButtonView.snp.bottom).offset(14.0)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingTableViewCell", for: indexPath) as! TrendingTableViewCell
        
        switch tableView {
        case trendingVC.tableView:
            break
        case cummunityVC.tableView:
            cell.elementView.logoView.image = UIImage(named: "DummyNFT")
        default:
            break
        }
        
        cell.selectionStyle = .none
        
        return cell
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

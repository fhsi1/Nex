//
//  TrendingDetailVC.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/20.
//

import Foundation
import UIKit
import SnapKit

class TrendingDetailVC: UIViewController {
    
    private lazy var backView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "BackView")
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.isScrollEnabled = true
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            profileView,
            scrollButton,
            interestCommunityView,
            eventView,
        ])
        
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 24.0
        return view
    }()
    
    lazy var profileView: TrendingProfileView = {
        let view = TrendingProfileView()
        view.cardView.profileCardView.nftView.image = UIImage(named: "NFT3")
        view.cardView.qrCardView.qrView.image = UIImage(named: "DummyQR")
        return view
    }()
    
    lazy var scrollButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "scrollDown"), for: .normal)
        return button
    }()
    
    lazy var interestCommunityView: TrendingContentsView = {
        let view = TrendingContentsView()
        return view
    }()
    
    lazy var eventView: TrendingContentsView = {
        let view = TrendingContentsView()
        view.titleView.titleLabel.text = "참여 이벤트"
        return view
    }()
    
    @objc func tappedBackButton() {
        print("tappedBackButton")
        tabBarController?.tabBar.isHidden = false
        navigationController?.navigationBar.isHidden = true
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupViews()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        
        let backIcon = UIImage(named: "leftArrow")?.withRenderingMode(.alwaysOriginal)
        
        let leftBarButtonItem = UIBarButtonItem(image: backIcon, style: .plain, target: self, action: #selector(tappedBackButton))
        
        self.navigationItem.leftBarButtonItems = [leftBarButtonItem]
    }
    
    private func setupViews() {
        [
            backView,
            scrollView
        ].forEach { view.addSubview($0) }
        
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        scrollView.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.centerX.top.bottom.equalToSuperview()
            $0.leading.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(scrollView.snp.width)
            $0.height.equalTo(1500.0)
        }
        
        profileView.snp.makeConstraints {
            $0.width.equalTo(stackView.snp.width)
            $0.height.equalTo(604.0)
        }
        
        scrollButton.snp.makeConstraints {
            $0.width.equalTo(stackView.snp.width)
            $0.height.equalTo(60.0)
        }
        
        interestCommunityView.snp.makeConstraints {
            $0.width.equalTo(stackView.snp.width)
            $0.height.equalTo(321.0)
        }
        
        eventView.snp.makeConstraints {
            $0.width.equalTo(stackView.snp.width)
            $0.height.equalTo(321.0)
        }
    }
}

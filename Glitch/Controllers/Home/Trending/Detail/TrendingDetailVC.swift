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
        view.cardView.profileCardView.descriptionLabel.text = "Web3 Surfer Nina Dobrev"
        view.cardView.qrCardView.descriptionLabel.text = "Web3 Surfer Nina Dobrev"
        view.scrollDownButton.addTarget(self, action: #selector(tappedScrollDownButton), for: .touchUpInside)
        return view
    }()
    
    lazy var interestCommunityView: TrendingContentsView = {
        let view = TrendingContentsView()
        view.titleView.titleLabel.text = "Joined Communites"
        
        view.tableView.dataSource = self
        
        view.tableView.register(TrendingContentsTableViewCell.self, forCellReuseIdentifier: "TrendingContentsTableViewCell")
        return view
    }()
    
    lazy var eventView: TrendingContentsView = {
        let view = TrendingContentsView()
        view.titleView.titleLabel.text = "Participated Events"
        view.tableView.dataSource = self
        
        view.tableView.register(TrendingContentsTableViewCell.self, forCellReuseIdentifier: "TrendingContentsTableViewCell")
        return view
    }()
    
    @objc func tappedBackButton() {
        print("tappedBackButton")
        tabBarController?.tabBar.isHidden = false
        navigationController?.navigationBar.isHidden = true
        navigationController?.popViewController(animated: true)
    }
    
    @objc func tappedScrollDownButton() {
        print("tappedScrollDownButton")
        
        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height - 700.0), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupViews()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        
        navigationItem.title = "Nina Dobrev"
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.nWhite!
        ]
        
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

extension TrendingDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingContentsTableViewCell", for: indexPath) as! TrendingContentsTableViewCell
        
        cell.selectionStyle = .none
        
        switch tableView {
        case interestCommunityView.tableView:
            switch indexPath.row {
            case 0:
                cell.elementView.countLabel.text = "31.5K"
            case 1:
                cell.elementView.logoView.image = UIImage(named: "Space")
                cell.elementView.titleLabel.text = "Space"
                cell.elementView.logoView.image = UIImage(named: "bitsSquare")
                cell.elementView.countLabel.text = "170.7K"
            case 2:
                cell.elementView.logoView.image = UIImage(named: "meme")
                cell.elementView.titleLabel.text = "MEME"
                cell.elementView.countLabel.text = "21.4K"
            default:
                break
            }
        case eventView.tableView:
            switch indexPath.row {
            case 0:
                cell.elementView.logoView.image = UIImage(named: "TaskFiSquare")
                cell.elementView.titleLabel.text = "TaskFi AI Protocol TaskFi AIWe..."
                cell.elementView.countLabel.text = "2023.05.18~2023.06.18"
            case 1:
                cell.elementView.logoView.image = UIImage(named: "bits")
                cell.elementView.titleLabel.text = "KewlPass NFT"
                cell.elementView.countLabel.text = "2023.05.18~2023.06.18"
            case 2:
                cell.elementView.logoView.image = UIImage(named: "League")
                cell.elementView.titleLabel.text = "Borrowers Rush Week 2"
                cell.elementView.countLabel.text = "2023.05.18~2023.06.18"
            default:
                break
            }
        default:
            break
        }
        
        return cell
    }
}

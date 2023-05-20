//
//  CommunityVC.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/13.
//

import Foundation
import UIKit

class AccountVC: UIViewController {
    
    private lazy var backView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "BackView")
        return view
    }()
    
    lazy var titleButtonView: TopCategroyButtonView = {
        let button = TopCategroyButtonView()
        button.firstButton.setTitle("Profile", for: .normal)
        button.secondButton.setTitle("Contents", for: .normal)
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
    
    lazy var profileVC: ProfileVC = {
        let vc = ProfileVC()
        return vc
    }()
    
    lazy var contentsVC: TrendingVC = {
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
        
        addChild(profileVC)
        profileVC.view.frame = contentView1.frame
        contentView1.addSubview(profileVC.view)
        profileVC.didMove(toParent: self)

        addChild(contentsVC)
        contentsVC.view.frame = contentView2.frame
        contentView2.addSubview(contentsVC.view)
        contentsVC.didMove(toParent: self)
        
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


extension AccountVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingTableViewCell", for: indexPath) as! TrendingTableViewCell
        
        cell.elementView.logoView.image = UIImage(named: "NFT3")
        cell.elementView.titleLabel.text = "Nex"
        
        cell.elementView.imageView.removeFromSuperview()
        cell.elementView.heartView.snp.makeConstraints {
            $0.leading.equalTo(cell.elementView.contentLabel.snp.leading)
            $0.top.equalTo(cell.elementView.contentLabel.snp.bottom).offset(20.0)
        }
        
        let moreButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "more"), for: .normal)
            return button
        }()
        
        cell.elementView.addSubview(moreButton)
        
        moreButton.snp.makeConstraints {
            $0.top.equalTo(cell.elementView.snp.top).inset(21.0)
            $0.trailing.equalTo(cell.elementView.snp.trailing).inset(16.0)
        }
        
        switch indexPath.row {
        case 0:
            cell.elementView.typeLabel.text = "Space"
            cell.elementView.contentLabel.text = """
            DeBank Airdrop Guide
            
            @DeBankDeFi
            raised over $25M from Sequoia, DragonFly, Coinbase
            Ventures and other VCs 🪂
            
            Don't miss your chance to position yourself for a
            potential DeBank airdrop.
            """
        case 1:
            cell.elementView.typeLabel.text = "Ronin"
            cell.elementView.contentLabel.text = """
            My friend gave me a space light and my room is a
            chaotic multiverse
            """
        case 2:
            cell.elementView.typeLabel.text = "MEME"
            cell.elementView.contentLabel.text = """
            No more data theft!
            your data = your icome 🤑 
            #HUDltoken is LIVE ON #BNBchain

            CONTRACT:
            1edwq09w3980129813hd9102910293sdasd092
            #PancakeSwap
            """
        default:
            break
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
}

extension AccountVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height: CGFloat = 0.0
        
        switch indexPath.row {
        case 0:
            height = 260.0
        case 1:
            height = 160.0
        case 2:
            height = 248.0
        default:
            break
        }
        
        return height
    }
}

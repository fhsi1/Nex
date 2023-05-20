//
//  EventVC.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/13.
//

import Foundation
import UIKit

class EventVC: UIViewController {
    
    private lazy var backView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "BackView")
        return view
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.rowHeight = 80.0
        view.backgroundColor = .clear
        
        view.register(EventTableViewCell.self, forCellReuseIdentifier: "EventTableViewCell")
        
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    private lazy var titleLabel: TopTitleLabelView = {
        let view = TopTitleLabelView()
        return view
    }()
    
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
        [
            backView,
            titleLabel,
            tableView
        ].forEach { view.addSubview($0) }
        
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(57.0)
            $0.leading.equalToSuperview().inset(24.0)
            $0.height.equalTo(29.0)
            $0.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(14.0)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

extension EventVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath) as! EventTableViewCell
        
        switch indexPath.row {
        case 0:
            break
        case 1:
            cell.elementView.titleLabel.text = "KewlPass NFT"
            cell.elementView.logoView.image = UIImage(named: "KewlPass")
            cell.elementView.viewCntLabel.text = "View 1,391"
        case 2:
            cell.elementView.titleLabel.text = "Borrowers Rush Week 2"
            cell.elementView.logoView.image = UIImage(named: "BorrowersRush")
            cell.elementView.viewCntLabel.text = "View 2,331"
        case 3:
            cell.elementView.titleLabel.text = "iZUMi x Syncera Partnership ..."
            cell.elementView.logoView.image = UIImage(named: "iZUMi")
            cell.elementView.viewCntLabel.text = "View 1,300"
        case 4:
            cell.elementView.titleLabel.text = "bit’s Tribute to Classical NFTs ..."
            cell.elementView.logoView.image = UIImage(named: "bits")
            cell.elementView.viewCntLabel.text = "View 300"
        case 5:
            cell.elementView.titleLabel.text = "CrusSwap Community Mission ..."
            cell.elementView.logoView.image = UIImage(named: "CrusSwap")
            cell.elementView.viewCntLabel.text = "View 228"
        case 6:
            cell.elementView.titleLabel.text = "League of Traders May Giveaw ..."
            cell.elementView.logoView.image = UIImage(named: "League")
            cell.elementView.viewCntLabel.text = "View 5,212"
        case 7:
            cell.elementView.titleLabel.text = "TaskFi AI Protocol TaskFi AIWe..."
            cell.elementView.logoView.image = UIImage(named: "TaskFi")
            cell.elementView.viewCntLabel.text = "View 72"
        default:
            break
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
}

extension EventVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = EventDetailHalfVC()
        
        vc.modalPresentationStyle = .pageSheet
        
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [
                .custom { _ in
                    return 340.0
                }
            ]
            
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            
            sheet.preferredCornerRadius = 24.0
        }
        
        present(vc, animated: true)
    }
}

//
//  CommunityView.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/20.
//

import Foundation
import UIKit
import SnapKit

class TrendingContentsView: UIView {
    
    lazy var titleView: TrendingContentsTitleButton = {
        let view = TrendingContentsTitleButton()
        return view
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.rowHeight = 80.0
        view.dataSource = self
        
        view.register(TrendingContentsTableViewCell.self, forCellReuseIdentifier: "TrendingContentsTableViewCell")
        
        view.isScrollEnabled = false
        view.backgroundColor = .clear
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViews() {
        [
            titleView,
            tableView
        ].forEach { addSubview($0) }
        
        titleView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(32.0)
        }
        
        tableView.snp.makeConstraints {
            $0.leading.equalTo(titleView.snp.leading)
            $0.trailing.equalTo(titleView.snp.trailing)
            $0.top.equalTo(titleView.snp.bottom)
            $0.height.equalTo(240.0)
        }
    }
}

extension TrendingContentsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingContentsTableViewCell", for: indexPath) as! TrendingContentsTableViewCell
        
        return cell
    }
    
    
}

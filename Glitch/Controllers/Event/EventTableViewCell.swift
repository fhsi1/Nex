//
//  EventTableViewCell.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/20.
//

import Foundation
import UIKit
import SnapKit

class EventTableViewCell: UITableViewCell {
    lazy var elementView: EventElementView = {
        let view = EventElementView()
        view.layer.cornerRadius = 12.0
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViews() {
        addSubview(elementView)
        
        elementView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.top.equalToSuperview().inset(6.0)
            $0.bottom.equalToSuperview().inset(6.0)
        }
    }
}

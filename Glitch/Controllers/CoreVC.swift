//
//  CoreVC.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/19.
//

import Foundation
import UIKit
import SnapKit

class CoreVC: UIViewController {
    
    private lazy var backView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "BackView")
        return view
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.backgroundColor = .nBlue
        button.addTarget(self, action: #selector(presentCoreApp), for: .touchUpInside)
        button.layer.cornerRadius = 8.0
        return button
    }()
    
    @objc func presentCoreApp() {
        print("presentingCoreApp Called")
        
//        let url = "Core://agoakfejjabomempkjlepdflaleeobhb/home.html#/"
//        let url = "Core://X-avax1jggdngzc9l87rgurmfu0z0n0v4mxlqta0h3k6e"
        
//        let url = "Core://wallet.avax.network/access/privatekey"
        let url = "Core://wallet.avax.network/enterwallet"
        
        if let openApp = URL(string: url), UIApplication.shared.canOpenURL(openApp) {
            // 버전별 처리
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(openApp, options: [:], completionHandler: nil)
            }
            else {
                UIApplication.shared.openURL(openApp)
            }
        }
        
        //스키마명을 사용해 외부앱 실행이 불가능한 경우
        else {
            print("[goDeviceApp : 디바이스 외부 앱 열기 실패]")
            print("링크 주소 : \(url)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        [
            backView,
            button
        ].forEach { view.addSubview($0) }
        
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.width.equalTo(100.0)
            $0.height.equalTo(button.snp.width)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}

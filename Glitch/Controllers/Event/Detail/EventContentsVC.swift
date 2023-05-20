//
//  EventContentsVC.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/21.
//

import Foundation
import UIKit
import SnapKit
import Moya
import Lottie
import KeychainSwift

class EventContentsVC: UIViewController {
    
    private lazy var backView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "eventBackView")
        return view
    }()
    
    lazy var animationView: LottieAnimationView = {
        let view = LottieAnimationView(name: "eventCheck")
        return view
    }()
    
    lazy var actionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Claim event", for: .normal)
        button.setTitleColor(.nWhite, for: .normal)
        button.backgroundColor = .nPurple
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(tappedActionButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedActionButton() {
        requestEvent()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView.play()
        setupViews()
    }
    
    private func setupViews() {
        [
            backView,
            animationView,
            actionButton
        ].forEach { view.addSubview($0) }
        
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        animationView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(180.0)
            $0.width.equalTo(375.0)
            $0.height.equalTo(375.0)
        }
        
        actionButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24.0)
            $0.trailing.equalToSuperview().inset(24.0)
            $0.height.equalTo(48.0)
            $0.bottom.equalToSuperview().inset(40.0)
        }
    }
}

extension EventContentsVC {
    func requestEvent() {
        let keychain = KeychainSwift()
        let provider = MoyaProvider<APIService>()
        
        let json = [
            "address": "0xDF0A4DC76eD4d47a06C3421941504975D5D57FFE",
            "prize": 1
        ] as [String : Any]
        
        provider.request(.event(request: json)) { result in
            switch result {
            case .success(let response):
                print("✅ success")
                
                do {
                    let responseObject = try JSONDecoder().decode(EventResponse.self, from: response.data)
                    
                    keychain.set(responseObject.externalURL, forKey: "externalURL")
                    
                    print(responseObject.externalURL)
                    
                } catch {
                    print(error)
                }
                
                let vc = UpdateNFTVC()
                
                vc.modalPresentationStyle = .overCurrentContext
                
                guard let pvc = self.presentingViewController else { return }

                self.dismiss(animated: true) {
                  pvc.present(vc, animated: true, completion: nil)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

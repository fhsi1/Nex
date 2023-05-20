//
//  CoreVC.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/19.
//

import Foundation
import UIKit
import SnapKit
import web3swift
import Web3Core

class CoreVC: UIViewController {
    
    let privateKey: String = "0x3f947d69b79e854a937a668c2fa194f7bac25cc1182ba98131a698c12038ec43"
    
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
        
        let _storeUrl =  "itms-apps://itunes.apple.com/app/" + "core-crypto-wallet-nfts/id6443685999"
        
//        let url = "Core://agoakfejjabomempkjlepdflaleeobhb/home.html#/"
//        let url = "Core://X-avax1jggdngzc9l87rgurmfu0z0n0v4mxlqta0h3k6e"
        
//        let url = "Core://wallet.avax.network/access/privatekey"
        
        let url = "Core://create_wallet"
        
        if let openApp = URL(string: url), UIApplication.shared.canOpenURL(openApp) {
            // 버전별 처리
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(openApp, options: [:]) { _ in
                    self.importWalletWith(privateKey: self.privateKey)
                }
            }
            else {
                UIApplication.shared.openURL(openApp)
            }
        } else {
            if let openStore = URL(string: _storeUrl), UIApplication.shared.canOpenURL(openStore) {
                
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(openStore, options: [:], completionHandler: nil)
                }
                else {
                    UIApplication.shared.openURL(openStore)
                }
            }
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

extension CoreVC {
    func importWalletWith(privateKey: String) {
        let formattedKey = privateKey.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let dataKey = Data.fromHex(formattedKey) else {
//            self.showAlertMessage(title: "Error", message: "Please enter a valid Private key ", actionName: "Ok")
            return
        }
        do {
            let keystore =  try EthereumKeystoreV3(privateKey: dataKey, password: "")
            if let myWeb3KeyStore = keystore {
                let manager = KeystoreManager([myWeb3KeyStore])
                let address = keystore?.addresses?.first
#if DEBUG
                print("Address :::>>>>> ", address)
                print("Address :::>>>>> ", manager.addresses)
#endif
                let walletAddress = manager.addresses?.first?.address
//                self.walletAddressLabel.text = walletAddress ?? "0x"

                print(walletAddress)
            } else {
                print("error")
            }
        } catch {
#if DEBUG
            print("error creating keyStore")
            print("Private key error.")
#endif
            let alert = UIAlertController(title: "Error", message: "Please enter correct Private key", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .destructive)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }

    }
}

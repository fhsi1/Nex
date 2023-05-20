//
//  UIScrollView+.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/21.
//

import Foundation
import UIKit

extension UIScrollView {
    func scrollDown() {
        let desiredOffset = CGPoint(x: 0, y: contentInset.bottom)
        setContentOffset(desiredOffset, animated: true)
    }
}

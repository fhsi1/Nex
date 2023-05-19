//
//  halfCircleLeftView.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/19.
//

import Foundation
import UIKit
import SnapKit

class halfCircleLeftView: UIView {
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = rect.width / 2.0
        
        let startAngle = 3.0 * CGFloat.pi / 2.0
        let endAngle = CGFloat.pi / 2.0
        
        let path = UIBezierPath()
        path.move(to: center)
        path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        path.close()
        
        UIColor.nDarkBlack!.setFill()
        path.fill()
    }
}

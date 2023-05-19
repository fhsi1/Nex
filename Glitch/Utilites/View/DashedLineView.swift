//
//  DashedLineView.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/19.
//

import Foundation
import UIKit

class DashedLineView: UIView {
    
    override func draw(_ rect: CGRect) {
        let color = UIColor.gray
        
        let path = UIBezierPath()
        path.lineWidth = 2
        path.setLineDash([4, 2], count: 2, phase: 0)
        path.move(to: CGPoint(x: 0, y: bounds.height / 2))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height / 2))
        
        color.setStroke()
        
        path.stroke()
    }
}

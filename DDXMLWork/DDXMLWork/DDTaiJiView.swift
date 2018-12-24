//
//  DDTaiJiView.swift
//  DDXMLWork
//
//  Created by 风荷举 on 2018/12/4.
//  Copyright © 2018年 ddWorker. All rights reserved.
//

import UIKit

class DDTaiJiView: UIView {
    
    var pathWhite: UIBezierPath!
    
    var pathWhiteEye: UIBezierPath!
    
    var pathBlack: UIBezierPath!
    
    var pathBlackEye: UIBezierPath!

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        backgroundColor = .clear
        let white: UIColor = .white
        let black: UIColor = .black
        let width: CGFloat = min(bounds.width, bounds.height)
        let midX: CGFloat = bounds.width*0.5
        let midY: CGFloat = bounds.height*0.5
        
        // 白鱼
        pathWhite = UIBezierPath(arcCenter: CGPoint(x: midX, y: midY), radius: width*0.5, startAngle: .pi*0, endAngle: .pi*2, clockwise: false)
        white.setFill()
        pathWhite.fill()
        
        // 白鱼眼
        pathWhiteEye = UIBezierPath(arcCenter: CGPoint(x: midX - width*0.25, y: midY), radius: width*0.0618, startAngle: .pi*0, endAngle: .pi*2, clockwise: false)
        black.setFill()
        pathWhiteEye.fill()
        
        // 黑鱼
        pathBlack = UIBezierPath(arcCenter: CGPoint(x: midX, y: midY), radius: width*0.5, startAngle: .pi*0, endAngle: .pi*1, clockwise: true)
        pathBlack.addArc(withCenter: CGPoint(x: midX - width*0.25, y: midY), radius: width*0.25, startAngle: .pi*1, endAngle: .pi*0, clockwise: false)
        pathBlack.addArc(withCenter: CGPoint(x: midX + width*0.25, y: midY), radius: width*0.25, startAngle: .pi*1, endAngle: .pi*0, clockwise: true)
        black.setFill()
        pathBlack.fill()
        
        // 黑鱼眼
        pathBlackEye = UIBezierPath(arcCenter: CGPoint(x: midX + width*0.25, y: midY), radius: width*0.0618, startAngle: .pi*0, endAngle: .pi*2, clockwise: false)
        white.setFill()
        pathBlackEye.fill()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    
}

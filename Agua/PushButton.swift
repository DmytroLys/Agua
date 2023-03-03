//
//  PushButton.swift
//  Agua
//
//  Created by Dmytro Lyshtva on 02.03.2023.
//

import UIKit

@IBDesignable
class PushButton: UIButton {
    
    @IBInspectable var fillColor : UIColor = .green
    @IBInspectable var isAddButton: Bool = true
    
    private struct Constants {
        static let plusLineWidth: CGFloat = 3.0
        static let plusButtonScale: CGFloat = 0.6
        static let halfPointShift = 0.5
    }
    
    private var halfWidth: CGFloat {
        bounds.width / 2
    }
    
    private var halfHeight: CGFloat {
        bounds.height / 2
    }
    
    
    
    override func draw (_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        let plusWidth = min(bounds.width, bounds.height) * Constants.plusButtonScale
        let halfOfPuslWidth = plusWidth / 2
        
        
        let plusPath = UIBezierPath()
        plusPath.lineWidth = Constants.plusLineWidth
        
        plusPath.move(to: CGPoint(x: halfWidth - halfOfPuslWidth, y: halfHeight))
        plusPath.addLine(to: CGPoint(x: halfWidth + halfOfPuslWidth, y: halfHeight))
        
        
        if isAddButton {
            plusPath.move(to: CGPoint(x: halfWidth, y: halfHeight - halfOfPuslWidth))
            plusPath.addLine(to: CGPoint(x: halfWidth, y: halfHeight + halfOfPuslWidth))
        }
        
        UIColor.white.setStroke()
        
        plusPath.stroke()
        
        
    }
    
}

//
//  CounterView.swift
//  Agua
//
//  Created by Dmytro Lyshtva on 03.03.2023.
//

import UIKit


@IBDesignable
class CounterView: UIView {
    
    struct Constants {
        static let numberOfGlasses = 8
        static let lineWidth: CGFloat = 5.0
        static let arcWidth: CGFloat = 76
        
        static var halfOfLine : CGFloat {
            return lineWidth / 2
        }
    }
    
    @IBInspectable var counter: Int = 5 {
        didSet {
            if counter <= Constants.numberOfGlasses {
                setNeedsDisplay()
            }
        }
    }
    @IBInspectable var outlineColor: UIColor = .blue
    @IBInspectable var counterColor: UIColor = .orange
    
    override func draw (_ rect: CGRect){
        
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        
        let radius = max(bounds.width, bounds.height)
        
//        In Swift, the bounds property is a CGRect object that represents the bounding rectangle of a view or layer, specified in the view or layer's own coordinate system. The CGRect object has properties width and height, which represent the dimensions of the rectangle.
//
//        The expression max(bounds.width, bounds.height) is used to determine the maximum dimension of the bounding rectangle of the view or layer, regardless of whether it is wider or taller. This is useful when you want to calculate the radius of a circle that completely encloses the view or layer, which is a common task in graphics programming.
//
//        By setting the radius to be equal to the maximum dimension of the bounding rectangle, you can ensure that the circle will be large enough to cover the entire view or layer, regardless of its aspect ratio. This approach is often used to create circular masks or overlays for views or layers, or to draw circular shapes around them.
        
        let startAngle: CGFloat = 3 * .pi / 4
        let endAngle: CGFloat = .pi / 4
        
        let path = UIBezierPath(
            arcCenter: center,
            radius: radius / 2 - Constants.arcWidth / 2,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true)
        
        path.lineWidth = Constants.arcWidth
        counterColor.setStroke()
        path.stroke()
        
        
        
        let angleDifference: CGFloat = 2 * .pi - startAngle + endAngle
        let angleLenghtPerGlass = angleDifference / CGFloat(Constants.numberOfGlasses)
        let outlineEndAngle = angleLenghtPerGlass * CGFloat(counter) + startAngle
        
        let outerArcRadius = bounds.width / 2 - Constants.halfOfLine
        let outlinePath = UIBezierPath(
          arcCenter: center,
          radius: outerArcRadius,
          startAngle: startAngle,
          endAngle: outlineEndAngle,
          clockwise: true)
        
        let innerRadius = bounds.width / 2 - Constants.arcWidth + Constants.halfOfLine
        
        outlinePath.addArc(
            withCenter: center,
            radius: innerRadius,
            startAngle: outlineEndAngle,
            endAngle: startAngle,
            clockwise: false)
        
        outlinePath.close()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = Constants.lineWidth
        outlinePath.stroke()
        
        
        
        
        
        
    }
    
    
}

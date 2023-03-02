//
//  PushButton.swift
//  Agua
//
//  Created by Dmytro Lyshtva on 02.03.2023.
//

import UIKit

@IBDesignable
class PushButton: UIButton {

    override func draw (_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        UIColor.green.setFill()
        path.fill()
    }
    
}

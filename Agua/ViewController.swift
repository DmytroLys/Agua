//
//  ViewController.swift
//  Agua
//
//  Created by Dmytro Lyshtva on 02.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var counterView: CounterView!
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var graphView: GraphView!
    
    var isGraphViewShowing = false


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        counterLabel.text = String(counterView.counter)
    }
    
    @IBAction func pushButtonPressed(_ button: PushButton) {
        if button.isAddButton {
            counterView.counter += 1
        } else {
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        
        counterLabel.text = String(counterView.counter)
        
        if isGraphViewShowing {
          counterViewTap(nil)
        }
        
    }
    
    
   @IBAction func counterViewTap(_ gesture: UITapGestureRecognizer?) {
     if isGraphViewShowing {
       UIView.transition(
         from: graphView,
         to: counterView,
         duration: 0.8,
         options: [.transitionFlipFromLeft, .showHideTransitionViews],
         completion: nil
       )
     } else {
       UIView.transition(
         from: counterView,
         to: graphView,
         duration: 0.8,
         options: [.transitionFlipFromRight, .showHideTransitionViews],
         completion: nil
       )
     }
     isGraphViewShowing.toggle()
   }



}




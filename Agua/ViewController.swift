//
//  ViewController.swift
//  Agua
//
//  Created by Dmytro Lyshtva on 02.03.2023.
//

import UIKit

@IBDesignable
class ViewController: UIViewController {
    
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!


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
    }


}




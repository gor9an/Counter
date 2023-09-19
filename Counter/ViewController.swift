//
//  ViewController.swift
//  Counter
//
//  Created by Andrey Gordienko on 19.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var counterButton: UIButton!
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.text = "0"
        counterButton.setTitle("Click", for: .normal)
    }
    
    @IBAction func buttonDidTap() {
        counter += 1
        counterLabel.text = "Значение счётчика: \(counter)"
    }
    


}


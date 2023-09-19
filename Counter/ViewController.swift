//
//  ViewController.swift
//  Counter
//
//  Created by Andrey Gordienko on 19.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var additionButton: UIButton!
    @IBOutlet weak var subtractionButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.text = "0"
        
        additionButton.setTitle("+", for: .normal)
        additionButton.layer.cornerRadius = 10
        
        subtractionButton.setTitle("-", for: .normal)
        subtractionButton.layer.cornerRadius = 10
        
        resetButton.setTitle("RESET", for: .normal)
        
        historyTextView.text = "History:\n"
        historyTextView.layer.cornerRadius = 10
    }
    
    @IBAction func additionButtonDidTap() {
        counter += 1
        counterLabel.text = "Counter value: \(counter)"
        
        historyTextView.text += "+1\n"
    }
    @IBAction func subtractionButtonDidTap() {
        guard counter != 0 else {
            historyTextView.text += "0\n"
            return
        }
        
        if counter - 1 > 0 {
            counter -= 1
            counterLabel.text = "Counter value: \(counter)"
        } else {
            counter = 0
            counterLabel.text = "0"
        }
        
        historyTextView.text += "-1\n"
    }
    
    @IBAction func resetButtonDidTap() {
        counter = 0
        counterLabel.text = "0"
        
        historyTextView.text += "reset\n"
    }
    

}


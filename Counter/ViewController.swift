//
//  ViewController.swift
//  Counter
//
//  Created by Andrey Gordienko on 19.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var additionButton: UIButton!
    @IBOutlet weak private var subtractionButton: UIButton!
    @IBOutlet weak private var resetButton: UIButton!
    @IBOutlet weak private var historyTextView: UITextView!
    private var counter: Int = 0
    private let dateFormatter = DateFormatter()
    
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
        
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale(identifier: "ru_RUS")
    }
    
    @IBAction private func additionButtonDidTap() {
        counter += 1
        counterLabel.text = "Counter value: \(counter)"
        
        historyTextView.text += "[\(dateFormatter.string(from: Date()))] value changed to +1\n"
        textViewScroll()
    }
    @IBAction private func subtractionButtonDidTap() {
        guard counter != 0 else {
            historyTextView.text += "[\(dateFormatter.string(from: Date()))] attempt to reduce the counter value below 0\n"
            textViewScroll()
            return
        }
        
        counter -= 1
        if counter != 0 {
            counterLabel.text = "Counter value: \(counter)"
        } else {
            counterLabel.text = "0"
        }
        
        historyTextView.text += "[\(dateFormatter.string(from: Date()))] value changed to -1\n"
        textViewScroll()
    }
    
    @IBAction private func resetButtonDidTap() {
        counter = 0
        counterLabel.text = "0"
        
        historyTextView.text += "[\(dateFormatter.string(from: Date()))] value reset\n"
        textViewScroll()
    }
    private func textViewScroll() {
        let range = NSRange(location: historyTextView.text.count - 1, length: 1)
        historyTextView.scrollRangeToVisible(range)
    }
    
    
}


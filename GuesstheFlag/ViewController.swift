//
//  ViewController.swift
//  GuesstheFlag
//
//  Created by Miraç Doğan on 1.11.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var askedQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "ireland", "italy", "poland", "russia",
        "france", "germany", "monaco", "nigeria", "spain", "uk", "us"]
    
        askQuestion(action: nil)
        [button1, button2, button3].forEach {
                    $0?.imageView?.layer.borderWidth = 1
                    $0?.imageView?.layer.borderColor = UIColor.lightGray.cgColor
                }
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        title = ("\(countries[correctAnswer].uppercased()) - Score \(score)")
    }
    
    func checkQuestions(title: String) {
        if askedQuestion == 10 {
            let ac = UIAlertController(title: title, message: "This is last question! ", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
            askQuestion()
        } else {
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion(action:)))
            present(ac, animated: true)
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        askedQuestion += 1
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            checkQuestions(title: title)
        } else {
            title = "Wrong! That's the flag of \(countries[sender.tag].uppercased())"
            score -= 1
            checkQuestions(title: title)
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
}

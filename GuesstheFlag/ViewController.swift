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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "ireland", "italy", "poland", "russia",
        "france", "germany", "monaco", "nigeria", "spain", "uk", "us"]
    
        asQuestion()
        [button1, button2, button3].forEach {
                    $0?.imageView?.layer.borderWidth = 1
                    $0?.imageView?.layer.borderColor = UIColor.lightGray.cgColor
                }
    }
    
    func asQuestion() {
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }

}


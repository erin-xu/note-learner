//
//  BassViewController.swift
//  music1
//
//  Created by Erin Xu on 6/20/20.
//  Copyright © 2020 Erin Xu. All rights reserved.
//

import Foundation
import UIKit

class BassViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var chosenNote: UIImageView!
    var chosenName: String! = ""
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        score = 0
        scoreLabel.text = "0"
        let noteNames = ["a", "b", "c", "d", "e", "f", "g"]
        let noteName = noteNames.randomElement()!
        var num = 1
        let special = ["a", "b", "f", "g"]
        if special.contains(noteName) {
            num = Int.random(in: 1...2)
        }
        chosenNote.image = UIImage(named: "b\(noteName)\(num)")
        chosenName = noteName
    }
    
    @IBAction func tapped(_sender: UIButton) {
        if _sender.titleLabel!.text!.lowercased() == chosenName {
            score += 1
            scoreLabel.text = String(score)
            let noteNames = ["a", "b", "c", "d", "e", "f", "g"]
            let filterNames = noteNames.filter {$0 != chosenName}
            let noteName = filterNames.randomElement()!
            var num = 1
            let special = ["a", "b", "f", "g"]
            if special.contains(noteName) {
                num = Int.random(in: 1...2)
            }
            chosenNote.image = UIImage(named: "b\(noteName)\(num)")
            chosenName = noteName
        }
    }
}

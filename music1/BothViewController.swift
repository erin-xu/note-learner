//
//  BothViewController.swift
//  music1
//
//  Created by Erin Xu on 6/21/20.
//  Copyright © 2020 Erin Xu. All rights reserved.
//

import Foundation
import UIKit

class BothViewController: UIViewController {
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
        let clefs = ["t", "b"]
        let clef = clefs.randomElement()!
        let noteNames = ["a", "b", "c", "d", "e", "f", "g"]
        let filterNames = noteNames.filter {$0 != chosenName}
        let noteName = filterNames.randomElement()!
        var num = 1
        let bspecial = ["a", "b", "f", "g"]
        let tspecial = ["d", "e", "f", "g"]
        if clef == "t" && tspecial.contains(noteName) || clef == "b" && bspecial.contains(noteName) {
            num = Int.random(in: 1...2)
        }
        chosenNote.image = UIImage(named: "\(clef)\(noteName)\(num)")
        chosenName = noteName
    }
    
    @IBAction func tapped(_sender: UIButton) {
        if _sender.titleLabel!.text!.lowercased() == chosenName {
            score += 1
            scoreLabel.text = String(score)
            let clefs = ["t", "b"]
            let clef = clefs.randomElement()!
            let noteNames = ["a", "b", "c", "d", "e", "f", "g"]
            let filterNames = noteNames.filter {$0 != chosenName}
            let noteName = filterNames.randomElement()!
            var num = 1
            let bspecial = ["a", "b", "f", "g"]
            let tspecial = ["d", "e", "f", "g"]
            if clef == "t" && tspecial.contains(noteName) || clef == "b" && bspecial.contains(noteName) {
                num = Int.random(in: 1...2)
            }
            chosenNote.image = UIImage(named: "\(clef)\(noteName)\(num)")
            chosenName = noteName
        }
    }
}

//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultEmojiLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    
    var answersChosen: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        getYourCharacterResult()
    }
    
    private func getYourCharacterResult() {
        var rateOfAnswers: [Animal : Int] = [:]
        let answersTypes = answersChosen.map{ $0.animal }
        
        for answer in answersTypes {
            rateOfAnswers[answer] = (rateOfAnswers[answer] != nil ? rateOfAnswers[answer]! : 0) + 1
        }
        
        let rateSorted = rateOfAnswers.sorted(by: {(pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        })
        let frequentAnswer = rateSorted.first!.key
        
        resultEmojiLabel.text = "Вы - \(frequentAnswer.rawValue)!"
        resultDescriptionLabel.text = frequentAnswer.definition
        
    }
}

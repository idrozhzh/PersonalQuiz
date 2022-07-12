//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.07.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    

    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    var answersChosen: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let resultAnimal = defineResult()
        
        animalLabel.text = "Вы - \(resultAnimal?.rawValue ?? "🐙")"
        descriptionLabel.text = resultAnimal?.definition
        
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    
}
//MARK: Private methods
extension ResultViewController {
    private func defineResult() -> Animal? {
        let animalsQuantity = answersChosen.reduce(into: [:]){
            $0[$1.animal, default: 0] += 1
        }
        
        guard
            let result = animalsQuantity.max(by: { $0.value < $1.value})?.key
        else { return nil }
        
        return result
    }
}

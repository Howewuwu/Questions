//
//  SubjectsSelectViewController.swift
//  Questions
//
//  Created by Howe on 2023/11/11.
//

import UIKit

class SubjectsSelectViewController: UIViewController {
    
    
    var grade : Grade?
    var subjects : Subjects?
    
//    var grade2 : Grade
//    init?(grade2: Grade, code: NSCoder) {
//        self.grade2 = grade2
//        super.init(coder: code)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    // MARK: - viewDidLoad Section
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    // MARK: - IBACtion Section

    
    @IBSegueAction func addGradeAndSubject(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> QuestionsViewController? {
        if let buttonSubject = segueIdentifier?.description {
            switch buttonSubject {
            case "Mandarin" :
                subjects = .Mandarin
            case "English" :
                subjects = .English
            case "Mathematics" :
                subjects = .Mathematics
            case "Science" :
                subjects = .Science
            case "SocialStudies" :
                subjects = .SocialStudies
            case "ArtsAndHumanities" :
                subjects = .ArtsAndHumanities
            default :
                break
            }
        }
        let controller = QuestionsViewController(coder: coder)
        controller?.grade = self.grade
        controller?.subject = self.subjects
        return controller
    }
    
    
    
    
    // MARK: - function Section
    
    
    
}

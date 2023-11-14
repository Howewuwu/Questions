//
//  GradeSelectViewController.swift
//  Questions
//
//  Created by Howe on 2023/11/11.
//

import UIKit

class GradeSelectViewController: UIViewController {
    
    var grade : Grade?
    
    @IBOutlet var gradeSelectButtonsOuelet: [UIButton]!
    
    
    
    // MARK: - viewDidLoad Section
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    // MARK: - IBACtion Section
    
    
    @IBSegueAction func addGrade(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> SubjectsSelectViewController? {
        if let buttonGrade = segueIdentifier?.description {
            switch buttonGrade {
            case "one" :
                grade = .one
            case "two" :
                grade = .two
            case "three" :
                grade = .three
            case "four" :
                grade = .four
            case "five" :
                grade = .five
            case "six" :
                grade = .six
            default :
                break
            }
            print(grade!.rawValue)
            
        }
        
        let controller =  SubjectsSelectViewController(coder: coder)
        controller?.grade = self.grade
        return controller
    }
    
    
    
    
    // MARK: - function Section
    
    
    
}

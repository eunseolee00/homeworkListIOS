//
//  EditViewController.swift
//  homeworkList
//
//  Created by Elsa Eunseo Lee and Karen Ren on 3/31/22.
//

import UIKit

class EditViewController: UIViewController {


    @IBOutlet weak var assignment: UITextField!
    @IBOutlet weak var course: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    
    var homework : Homework? = nil
    var loc = 0
    var prevVC = HWTableViewController()
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        if let t = homework {
            assignment.text = t.assignment
            course.text = t.course
            if let d = t.date{
                date.date = d
            }
        }//viewDidLoad()

    }

    @IBAction func save(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as?AppDelegate)?.persistentContainer.viewContext{
            context.delete(homework!)
            
            let hw = Homework(entity: Homework.entity(), insertInto: context)
            
            if let assignment = assignment.text {
                hw.assignment = assignment
            }
            if let course = course.text {
                hw.course = course
            }
            
            hw.date = date.date
            
            try? context.save()
            prevVC.getHomework()
            navigationController?.popViewController(animated: true)
        }

    }//save
}

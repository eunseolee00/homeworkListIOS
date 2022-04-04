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
            date.setDate(t.date??, false)
        }//viewDidLoad()

    }

    @IBAction func save(_ sender: Any) {
        

    }//save
}

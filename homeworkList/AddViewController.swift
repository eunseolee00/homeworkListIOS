//
//  AddViewController.swift
//  homeworkList
//
//  Created by Eunseo Lee on 3/31/22.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var assignment: UITextField!
    @IBOutlet weak var course: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    
    var prevVC = HWTableViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }//AddViewController
    
    @IBAction func save(_ sender: Any ) {
        if let context = (UIApplication.shared.delegate as?AppDelegate)?.persistentContainer.viewContext{
            
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}//AddViewController

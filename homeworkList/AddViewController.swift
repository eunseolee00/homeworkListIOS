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
    @IBOutlet weak var date: UITextField!
    
    var prevVC = HWTableViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }//AddViewController
    
    @IBAction func save( sender: Any ) {
        
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

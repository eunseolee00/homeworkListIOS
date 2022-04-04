//
//  HWTableViewController.swift
//  homeworkList
//
//  Created by Elsa Eunseo Lee and Karen Ren on 3/31/22.
//

import UIKit

class HWTableViewController: UITableViewController {

    var HWList : [Homework] = []
    var loc = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }//viewDidLoad()
    
    func getHomework() {
        if let context = (UIApplication.shared.delegate as?AppDelegate)?.persistentContainer.viewContext{
            if let coreDataHW =  try? context.fetch(Homework.fetchRequest()) as? [Homework] {
                HWList = coreDataHW
                tableView.reloadData()
            }
        }
    }//getHomework()
    
    override func viewWillAppear(_ animated: Bool) {
        getHomework()
    }
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return HWList.count
    }//tableView

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        let assignment = HWList[indexPath.row].assignment
        _ = HWList[indexPath.row].course
        _ = HWList[indexPath.row].date
        
        cell.textLabel?.text = assignment
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        loc = indexPath.row
        performSegue(withIdentifier: "editSegue", sender: HWList[indexPath.row])
    }
    
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let homework = HWList[indexPath.row]
            
            if let context = (UIApplication.shared.delegate as?AppDelegate)?.persistentContainer.viewContext{
                context.delete(homework)
                getHomework()
            }
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    override func prepare( for segue: UIStoryboardSegue, sender: Any? ) {
            if  let editVC = (segue.destination as? EditViewController) {
                let homework = sender as! Homework
                editVC.homework = homework
                editVC.loc = loc
                editVC.prevVC = self
            }
            else if  let editVC = (segue.destination as? AddViewController) {
                
                editVC.prevVC = self
            }
            
        }//prepare

}//HWTableViewController

//
//  ViewController.swift
//  E-SchoolAttendence
//
//  Created by Pavan Kalyan Jonnadula on 03/05/20.
//  Copyright © 2020 Pavan Kalyan Jonnadula. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var classesTableView: UITableView!
    
    var allClassesInSchools = [Classes]()

    override func viewDidLoad() {
        super.viewDidLoad()
        classesTableView.delegate = self
        classesTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        allClassesInSchools = CoreDataHelper.shared.getAllData(entityName: "Classes") as? [Classes] ?? []
        classesTableView.reloadData()
    }

    @IBAction func addClassAction(_ sender: Any) {
        let alert = UIAlertController(title: "Enter Class details", message: "This class consists of number of students", preferredStyle: .alert)
        alert.addTextField { (textField : UITextField) in
            textField.placeholder = "Enter Class Name"
        }
        alert.addTextField { (textFiled : UITextField) in
            textFiled.placeholder = "Enter No of Students"
            textFiled.keyboardType = UIKeyboardType.numberPad
        }
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { (alertAction) in
            let firstTextField = alert.textFields?[0]
            let secondTextField = alert.textFields?[1]
            self.addClass(name: firstTextField?.text ?? "", numOfStudents: Int(secondTextField?.text ?? "") ?? 0)
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { (cancelAction) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func addClass(name : String , numOfStudents : Int){
        let newClass = Classes(context: CoreDataHelper.shared.context)
        newClass.classname = name
        newClass.numberstudents = Int16(numOfStudents)
        CoreDataHelper.shared.saveContext()
        allClassesInSchools = CoreDataHelper.shared.getAllData(entityName: "Classes") as? [Classes] ?? []
        classesTableView.reloadData()

    }
}

extension ViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allClassesInSchools.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let classIndex = allClassesInSchools[indexPath.row]
        cell.textLabel?.text = classIndex.classname
        cell.detailTextLabel?.text = "Number of students : \(classIndex.numberstudents)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

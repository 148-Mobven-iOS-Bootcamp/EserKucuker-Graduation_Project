//
//  TaskDetailTableViewController.swift
//  ToDoApp
//
//  Created by Eser Kucuker on 6.02.2022.
//

import UIKit

class TaskDetailTableViewController: UITableViewController, TaskDetailViewProtocol {

    

    
    @IBOutlet weak var addTaskTappedButton: UIButton!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var reminderSwitch: UISwitch!
    
    @IBOutlet weak var deadLineDateLabel: UILabel!
    
    @IBOutlet weak var detailTextView: UITextView!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    var interactor: TaskDetailInteractorProtocol?
    var router: TaskDetailRouterProtocol?
    var screenType: builderChoice!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func handleOutput(_ output: TaskDetailPresenterOutput) {
        <#code#>
    }

    // MARK: - Table view data source





}

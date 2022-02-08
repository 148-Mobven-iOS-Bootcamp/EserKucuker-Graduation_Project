//
//  TaskListViewController.swift
//  ToDoApp
//
//  Created by Eser Kucuker on 6.02.2022.
//

import UIKit

class TaskListViewController: UIViewController, TaskListViewProtocol {
    
    @IBOutlet weak var TaskListTableView: UITableView!{
        didSet{
            TaskListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "identifier")
        }
    }
    @IBOutlet weak var emptyList: UIImageView!
    @IBOutlet weak var emptyTaskListLabel: UILabel!
    
    var interactor: TaskListInteractorProtocol?
    var router: TaskListRouterProtocol?
    
    private var tasks: [TaskListPresentation] = []
    private var isSorted: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        interactor?.didchangeTodo()
        self.navigationController?.isNavigationBarHidden = true
    }
   // MARK: Presenter OutPut
    func handleOutput(_ output: TaskListPresenterOutput) {
        switch output {
        case .showToDoList(let task),.showSearchToDo(let task),.showDeletedToDo(let task):
            self.tasks = task
            if(task.count == 0)
            {
                self.emptyTaskListLabel.isHidden = false
                self.emptyList.isHidden = false
            }
            else {
                self.emptyList.isHidden = true
                self.TaskListTableView.isHidden = false
                self.emptyTaskListLabel.isHidden = true
            }
        case .showSortedToDo(let task, let flag):
            self.tasks = task
            self.isSorted = flag
        case .showEmptyData:
            self.emptyList.isHidden = false
            self.emptyTaskListLabel.isHidden = false
            self.TaskListTableView.reloadData()
        }
        DispatchQueue.main.async {
            self.TaskListTableView.reloadData()
        }
    }
    
    @IBAction func AddTaskTappedButton(_ sender: UIButton) {
        router?.navigate(to: .showAddView)
    }
    
    @IBAction func SortedListTappedButton(_ sender: UIButton) {
        sender.isSelected = isSorted ? false : true
        interactor?.didSortedData(by: isSorted)
    }
    
}
// MARK: UITableViewDelegate
extension TaskListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.navigate(to: .showTodoDetail(index: indexPath.row))
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            interactor?.deleteData(at: indexPath)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
        }
    }
}
// MARK: UITableViewDataSource
extension TaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row].title
        return cell
    }
}
// MARK: UISearchBarDelegate
extension TaskListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        interactor?.didSearchdata(with: searchText)
    }
}


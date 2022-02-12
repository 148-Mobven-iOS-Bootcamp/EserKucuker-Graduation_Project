//
//  TaskListInteractor.swift
//  ToDoApp
//
//  Created by Eser Kucuker on 6.02.2022.
//

import Foundation


class TaskListInteractor : TaskListInteractorProtocol , TaskListDataStoreProtocol{
    
    var presenter: TaskListPresenterProtocol?
    var tasks : [Tasks] = []
    var dataManager : DataManagerProtocol
    
    init(dataManager: DataManagerProtocol){
        self.dataManager = dataManager
    }
    
    func viewDidLoad() {
        getdata()
    }
    
    
    func didchangeTodo(){
        getNewList()
    }
    
    func getNewList(){
        if appContainer.ischange == true {
            getdata()
            appContainer.ischange = false
        }
        
    }
    
    func getdata(){
        tasks = dataManager.fetchData()
        if (tasks.count > 0 ) {
            self.presenter?.handeOutput(.showUpdateData(tasks))
        } else {
            self.presenter?.handeOutput(.showEmptyData)
        }
        // self.presenter?.handeOutput(.showUpdateData(tasks))
    }
    
    func didSortedData(by isSorted: Bool) {
        tasks = isSorted ? dataManager.fetchData() : dataManager.sortbyCreatedData()
        
//        let newTask:[Tasks]
//        // TODO: Refactor
//        if (isSorted)
//        {
//            newTask = tasks.sorted{ guard let deadlineDate0 = $0.deadlineDate, let deadlineDate1 = $1.deadlineDate
//                else { return false }
//                return deadlineDate0 < deadlineDate1 }
//        }
//        else {
//            newTask = tasks.sorted { guard let deadlineDate0 = $0.deadlineDate, let deadlineDate1 = $1.deadlineDate
//                else { return false }
//                return deadlineDate0 > deadlineDate1 }
//        }
        
        
        if tasks.count > 0{
            self.presenter?.handeOutput(.sortData(tasks, !isSorted))
        }
        else {
            self.presenter?.handeOutput(.showEmptyData)
        }
    }
    
    func didSearchdata(with searchText: String) {
        // tasks = searchText.isEmpty ? dataManager.fetchData() : dataManager.searchData(with: searchText)
        let newTask = searchText.isEmpty ? tasks : tasks.filter{
            guard let title = $0.title else { return false }
            return title.range(of: searchText, options: .caseInsensitive ) != nil }
        self.presenter?.handeOutput(.showSearchData(newTask))
    }
    
    func deleteData(at indexPath: IndexPath) {
        let data = tasks[indexPath.row]
        dataManager.deleteData(todoItem: data)
        tasks = dataManager.fetchData()
        self.presenter?.handeOutput(.deletedata(tasks))
        
        
    }
    
}

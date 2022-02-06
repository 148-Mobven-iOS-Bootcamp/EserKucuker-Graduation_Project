//
//  TaskListPresenter.swift
//  ToDoApp
//
//  Created by Eser Kucuker on 6.02.2022.
//

import Foundation

class TaskListPresenter: TaskListPresenterProtocol {
    weak var viewController: TaskListViewProtocol?
    
    func handeOutput(_ output: TaskListInteractorOutput) {
        switch output {
        case .showData(let tasks),.showUpdateData(let tasks):
            viewController?.handleOutput(.showToDoList(tasks.map(TaskListPresentation.init)))
        case .sortData(let sortedData, let flag):
            viewController?.handleOutput(.showSortedToDo(sortedData.map(TaskListPresentation.init), flag))
        case .showSearchData(let tasks):
            viewController?.handleOutput(.showSearchToDo(tasks.map(TaskListPresentation.init)))
        case .deletedata(let tasks):
            viewController?.handleOutput(.showDeletedToDo(tasks.map(TaskListPresentation.init)))
        case .showEmptyData:
            viewController?.handleOutput(.showEmptyData)
        }
    }
}

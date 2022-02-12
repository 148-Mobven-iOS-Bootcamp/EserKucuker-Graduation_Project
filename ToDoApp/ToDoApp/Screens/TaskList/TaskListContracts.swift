//
//  TaskListContracts.swift
//  ToDoApp
//
//  Created by Eser Kucuker on 6.02.2022.
//

import Foundation

typealias TaskListRouterProtocol = TaskListRoutingProtocol & TaskListDataPassingProtocol

// MARK: VIEW

protocol TaskListViewProtocol: NSObject {
    func handleOutput(_ output: TaskListPresenterOutput)
}


// MARK: INTERACTOR
protocol TaskListInteractorProtocol{
    func viewDidLoad()
    func didchangeTodo()
    func didSortedData(by isSorted: Bool)
    func didSearchdata(with searchText : String)
    func deleteData(at indexPath : IndexPath)
    
}

enum TaskListInteractorOutput {
    case showData([Tasks])
    case showUpdateData([Tasks])
    case sortData([Tasks],Bool)
    case showSearchData([Tasks])
    case deletedata([Tasks])
    case showEmptyData
}


// MARK: PRESENTER

protocol TaskListPresenterProtocol {
    func handeOutput(_ output: TaskListInteractorOutput)
}

enum TaskListPresenterOutput {
    case showToDoList([TaskListPresentation])
    case showSearchToDo([TaskListPresentation])
    case showDeletedToDo([TaskListPresentation])
    case showSortedToDo([TaskListPresentation], Bool)
    case showEmptyData
}


// MARK: ROUTER

protocol TaskListRoutingProtocol   {
    func navigate(to route: TaskListRoute)
}

enum TaskListRoute {
    case showTodoDetail(index: Int)
    case showAddView
}


// MARK: DATA

protocol TaskListDataStoreProtocol {
    var tasks: [Tasks] { get set }
}

protocol TaskListDataPassingProtocol {
    var dataStore: TaskListDataStoreProtocol? { get }
}


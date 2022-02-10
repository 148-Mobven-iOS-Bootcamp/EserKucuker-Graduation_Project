//
//  TaskDetailContracts.swift
//  ToDoApp
//
//  Created by Eser Kucuker on 6.02.2022.
//

import Foundation

typealias TaskDetailRouterProtocol = TaskDetailRoutingProtocol & TaskDetailDataPassingProtocol

// MARK: VIEW

protocol TaskDetailViewProtocol: NSObject {
    func handleOutput(_ output: TaskDetailPresenterOutput)
}
enum builderChoice {
    case DetailView
    case AddView
}

// MARK: INTERACTOR

protocol TaskDetailInteractorProtocol {
    func viewdidload()
    func addTask(task: TaskDetailPresentation)
    func update(tasks:TaskDetailPresentation)
}

enum TaskDetailInteractorOutput {
    case showTask(Tasks)
    case addTask
}

// MARK: PRESENTER

protocol TaskDetailPresenterProtocol {
    func handleOutput(_ output: TaskDetailInteractorOutput)
}

enum TaskDetailPresenterOutput {
    case showTodoDetail(TaskDetailPresentation)
    case addTodo
}

// MARK: ROUTER

protocol TaskDetailRoutingProtocol {
    func navigate(to route: TaskDetailRoute)
}

enum TaskDetailRoute{
    case showToDoList
    case saveAndBack
}

// MARK: DATA

protocol TaskDetailDataStoreProtocol {
    var task: Tasks? {get set}
}

protocol TaskDetailDataPassingProtocol {
    var dataStore: TaskDetailDataStoreProtocol? {get}
}


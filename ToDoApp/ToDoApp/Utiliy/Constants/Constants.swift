//
//  Constants.swift
//  ToDoApp
//
//  Created by Eser Kucuker on 8.02.2022.
//

import Foundation

enum CoreData: String{
    case name = "ToDoApp"
    case entityName = "Tasks"
    case key = "createdDate"
    case title = "title"
    case detail = "detail"
    case deadlineDate = "deadlineDate"
}

enum TaskDetailBuilderString: String {
    case name = "TaskDetail"
}

enum TaskDetailViewController: String{
    case addTaskButtonText = "Update"
    case alertMessage = "Lütfen Başlık Giriniz"
}

enum TaskListBuilderString : String{
    case name = "TaskList"
}

enum TaskListVC  : String {
    case identifier = "identifier"
    case titleForDeleteConfirmationButtonForRowAt = "Delete"
}
//notification nameleri hazırlık
struct Notification {
    var id : String
    var title : String
    var subTitle : String
    var date: DateComponents
}


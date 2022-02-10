//
//  TaskDetailInteractor.swift
//  ToDoApp
//
//  Created by Eser Kucuker on 6.02.2022.
//

import Foundation

class TaskDetailInteractor: TaskDetailInteractorProtocol, TaskDetailDataStoreProtocol {
    
    
    var task: Tasks?
    var presenter: TaskDetailPresenterProtocol?
    var dataManager : DataManagerProtocol
    var notificationManager : NotificationManagerProtocol
    
    init(dataManager: DataManagerProtocol, notificationManager: NotificationManagerProtocol){
        self.dataManager = dataManager
        self.notificationManager = notificationManager
    }

    func viewdidload() {
        if let tasks = task {
            self.presenter?.handleOutput(.showTask(tasks))
        }
        else{
            self.presenter?.handleOutput(.addTask)
        }
    }
    
    func addTask(task:TaskDetailPresentation) {
        notificationManager.listScheduledNotifications()
        dataManager.saveData(task: task)
        if(task.deadlineDate != nil){
            addNotification(task:task)
        }
    }
    
    func update(tasks: TaskDetailPresentation){
        guard let todo = task else { return }
        notificationManager.deleteOldNotificationForUpdate(title: tasks.title)
        dataManager.updateData(todoItem: todo, title: tasks.title, detail: tasks.detail, date: tasks.deadlineDate)
        
        if(tasks.deadlineDate != nil){
            addNotification(task:tasks)
        }
    }
    
    func addNotification(task:TaskDetailPresentation){
        let dateComponent = Calendar.current.dateComponents([.year,.month,.day, .hour, .minute], from: task.deadlineDate!)
        let notification = Notification(id: UUID().uuidString, title: task.title, subTitle: task.detail, date: dateComponent)
        notificationManager.notifications.append(notification)
        notificationManager.schedule()
        print(notification)
    }
}

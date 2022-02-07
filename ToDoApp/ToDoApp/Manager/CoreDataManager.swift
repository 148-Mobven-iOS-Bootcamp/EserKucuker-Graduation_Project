//
//  CoreDataManager.swift
//  ToDoApp
//
//  Created by Eser Kucuker on 7.02.2022.
//

import Foundation
import CoreData


class CoreDataManager : DataManagerProtocol {
    
    // MARK: - Core Data stack
    static let  shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "vip")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    //MARK: - Core Data Functions
    
    func updateData(todoItem: Tasks, title: String, subtitle: String, date: Date) {
        <#code#>
    }
    
    func saveData(task: TaskDetailPresentation) {
        <#code#>
    }
    
    func fetchData() -> [Tasks] {
        <#code#>
    }
    
    func deleteData(todoItem: Tasks) {
        <#code#>
    }
    
    func sortbyCreatedData() -> [Tasks] {
        <#code#>
    }
    
    func searchData(with: String) -> [Tasks] {
        <#code#>
    }
    
}

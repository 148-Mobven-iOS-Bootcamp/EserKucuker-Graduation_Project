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
        let container = NSPersistentContainer(name: CoreData.name.rawValue)
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
    
    func updateData(todoItem: Tasks, title: String, detail: String, date: Date?) {
        let manageContext = persistentContainer.viewContext
        todoItem.title = title
        todoItem.detail = detail
        todoItem.deadlineDate = date
        todoItem.createdDate = Date()
        
        do {
            if manageContext.hasChanges{
                try manageContext.save()
                print("Basariyla  Guncellendi.")
            }
        } catch  {
            print("Guncelleme Basarisiz oldu")
            debugPrint("Guncelleme hatasi: \(error.localizedDescription)")
        }
    }
    
    func saveData(task: TaskDetailPresentation) {
        let manageContext = persistentContainer.viewContext
        let model = Tasks(context: manageContext )
        model.title = task.title
        model.detail = task.detail
        model.deadlineDate = task.deadlineDate
        model.createdDate = Date()
        do {
            if manageContext.hasChanges{
                try  manageContext.save()
                print("Basariyla kaydedildi.")
            }
        } catch
        {
            debugPrint("Kaydetme hatasi: \(error.localizedDescription)")
        }
    }
    
    func fetchData() -> [Tasks] {
        let request = NSFetchRequest<Tasks>(entityName: CoreData.entityName.rawValue)
        let manageContext = persistentContainer.viewContext
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try manageContext.fetch(request)
            print("CoreData Verileri Basariyla alindi.")
            return result
            
        } catch {
            debugPrint("Veri Cekme hatasi: \(error.localizedDescription)")
        }
        return []
    }
    
    func deleteData(todoItem: Tasks) {
        let manageContext = persistentContainer.viewContext
        manageContext.delete(todoItem)
        do {
            try  manageContext.save()
            print("Basariyla Silindi.")
        } catch  {
            debugPrint("Silme hatasi: \(error.localizedDescription)")
        }
    }
    
    func sortbyCreatedData() -> [Tasks] {
        let manageContext = persistentContainer.viewContext
        let request = NSFetchRequest<Tasks>(entityName: CoreData.entityName.rawValue)
        let sorter = NSSortDescriptor(key: CoreData.key.rawValue, ascending: false)
        request.sortDescriptors = [sorter]
        request.returnsObjectsAsFaults = false
        do {
            let result = try manageContext.fetch(request)
            print("Result : \(result)")
            return result
            
        } catch {
            debugPrint("Siralama hatasi: \(error.localizedDescription)")
        }
        return []
    }
    
    func searchData(with: String) -> [Tasks] {
        let manageContext = persistentContainer.viewContext
        let request = NSFetchRequest<Tasks>(entityName: CoreData.entityName.rawValue)
        request.predicate = NSPredicate(format: "title contains[c] '\(with)'")
        
        do {
            let data = try manageContext.fetch(request)
            return data
        } catch  {
            debugPrint("Arama hatasi: \(error.localizedDescription)")
        }
        return []
    }
    
    deinit {
        print("CoreDataManager deinit oldu.")
    }
}

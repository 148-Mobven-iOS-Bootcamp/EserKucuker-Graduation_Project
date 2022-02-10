//
//  Validiator+.swift
//  ToDoApp
//
//  Created by Eser Kucuker on 8.02.2022.
//

import Foundation

func isValidInput(Input: String) -> Bool {
    
    let regex = "^[0-9a-zA-Z\\_]{2,}$"
    let test = NSPredicate(format: "SELF MATCHES %@", regex)
    let result = test.evaluate(with: Input)
    
    return result
}

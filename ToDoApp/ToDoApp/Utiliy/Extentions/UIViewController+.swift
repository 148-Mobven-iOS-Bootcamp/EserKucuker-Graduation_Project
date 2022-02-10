//
//  UIViewController+.swift
//  ToDoApp
//
//  Created by Eser Kucuker on 10.02.2022.
//

import Foundation
import UIKit


extension UIViewController {
    func setupHideKeyboardWhenTapOutside() {
        self.view.addGestureRecognizer(self.endEditingRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
    }

    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
}

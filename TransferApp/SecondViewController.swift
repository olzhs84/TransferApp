//
//  SecondViewController.swift
//  TransferApp
//
//  Created by olzhs on 24.01.2022.
//

import UIKit


class SecondViewController: UIViewController, UpdatingDataController {
    
    @IBOutlet var dataTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateTextFieldData(withText: updatingData)
    }
    
    private func updateTextFieldData(withText text: String) {
        dataTextField.text = text
    }
    
    var updatingData: String = ""
    
    
}

protocol UpdatingDataController: AnyObject {
    var updatingData: String { get set }
}

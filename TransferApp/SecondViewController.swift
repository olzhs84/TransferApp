//
//  SecondViewController.swift
//  TransferApp
//
//  Created by olzhs on 24.01.2022.
//

import UIKit


class SecondViewController: UIViewController, UpdatingDataController {
    
    @IBOutlet var dataTextField: UITextField!
    
    @IBAction func saveDataWithProperty(_ sender: UIButton) {
   
        self.navigationController?.viewControllers.forEach {
            viewController in (viewController as? ViewController)?.updatedData = dataTextField.text ?? ""
            self.navigationController?.popToViewController(viewController , animated: true)
        }
    }
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "toFirstScreen":
            prepareFirstScreen(segue)
        default:
            break
        }
        
    }
    
    private func prepareFirstScreen(_ segue: UIStoryboardSegue) {
        guard let destinationController = segue.destination as? ViewController else {
            return
        }
        
        destinationController.updatedData = dataTextField.text ?? ""
    }
    
}

protocol UpdatingDataController: AnyObject {
    var updatingData: String { get set }
}

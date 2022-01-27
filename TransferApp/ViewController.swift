//
//  ViewController.swift
//  TransferApp
//
//  Created by olzhs on 24.01.2022.
//

import UIKit

class ViewController: UIViewController, DataUpdateProtocol {

    @IBOutlet var dataLabel: UILabel!
    
    var updatedData: String = "Test data"
    
    @IBAction func editDataWithProperty(_ sender: UIButton) {
        
        let storboard = UIStoryboard(name: "Main", bundle: nil)
        let editScreen = storboard.instantiateViewController(withIdentifier: "SecondViewController") as! UpdatingDataController
        
        editScreen.updatingData = dataLabel.text ?? ""
        
        self.navigationController?.pushViewController(editScreen as! UIViewController, animated: true)
        
    }
    

    @IBAction func unwinToFirstScreen(_ segue: UIStoryboardSegue) {
    }

    @IBAction func editDataWithDelegate(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editScreen = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        editScreen.updatingData = dataLabel.text ?? ""
        editScreen.handleUpdateDataDelegate = self
        self.navigationController?.pushViewController(editScreen, animated: true)
    }
    
    @IBAction func editDataWithClosure(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editScreen = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        editScreen.updatingData = dataLabel.text ?? ""
        
        editScreen.completionHandler = { [unowned self] updatedValue in
            updatedData = updatedValue
            updatedLabel(withText: updatedValue)
            
            self.navigationController?.pushViewController(editScreen, animated: true)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updatedLabel(withText: updatedData)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "toEditScreen":
            prepareEditScreen(segue)
        default: break
        }
        
    }
    
    private func prepareEditScreen(_ segue: UIStoryboardSegue) {
        
        guard let destinationController = segue.destination as? SecondViewController else {
            return
        }
        
        destinationController.updatingData = dataLabel.text ?? ""
    }
    
    private func updatedLabel(withText text: String) {
        dataLabel.text = text
    }
    
    func onDataUpdate(data: String) {
        updatedData = data
        updatedLabel(withText: data)
    }
    
    
}


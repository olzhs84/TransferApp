//
//  ViewController.swift
//  TransferApp
//
//  Created by olzhs on 24.01.2022.
//

import UIKit

class ViewController: UIViewController {

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
        dataLabel.text = updatedData
    }
    
    
    
}


//
//  ViewController.swift
//  Deloitte
//
//  Created by Roberto Gutierrez on 09/11/16.
//  Copyright © 2016 Roberto Gutierrez. All rights reserved.
//

import UIKit

class TokenViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var tokenTextfield: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.presentarWalktrough()
        }
        self.tokenTextfield.delegate = self
        self.tokenTextfield.keyboardType = UIKeyboardType.emailAddress
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TokenViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func presentarWalktrough() {
        
        let defaults = UserDefaults.standard
        let hasViewedWalkthrough = defaults.bool(forKey: "hasViewedWalkthrough")
        if hasViewedWalkthrough == false {
            if let pageViewController =
                storyboard?.instantiateViewController(withIdentifier: "PageViewController") as?
                PageViewController {
                self.present(pageViewController, animated: true, completion: nil)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ingresarBotonPressed(_ sender: Any) {
        
        if isValidEmail(testStr: tokenTextfield.text!) == false {
            mostraMSJ(msj: "Por favor ingrese un email válido")
        } else {
            performSegue(withIdentifier: "segueInicio", sender: self)
        }
        
    }
    

    func isValidEmail(testStr:String) -> Bool {
        // println("validate calendar: \(testStr)")
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func mostraMSJ(msj: String){
        
        print("Mostrando mensaje")
        let alertController = UIAlertController(title: "Deloitte App", message: msj, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        
        
    }

}


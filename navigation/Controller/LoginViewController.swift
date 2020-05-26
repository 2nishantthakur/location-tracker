//
//  LoginViewController.swift
//  navigation
//
//  Created by Nishant Thakur on 23/05/20.
//  Copyright © 2020 Nishant Thakur. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    let db = Firestore.firestore()
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginPressed(_ sender: Any) {
        if let email = emailTF.text, let password = passwordTF.text{
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if error != nil{
                    print(error)
                }
                else{
                    print("Logged IN")
                    self.performSegue(withIdentifier: "SuccessfullLogin", sender: self)
                }
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

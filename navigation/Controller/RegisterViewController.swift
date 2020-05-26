//
//  RegisterViewController.swift
//  navigation
//
//  Created by Nishant Thakur on 23/05/20.
//  Copyright © 2020 Nishant Thakur. All rights reserved.
//

import UIKit
import Firebase
class RegisterViewController: UIViewController {
    let db = Firestore.firestore()
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func registerTF(_ sender: Any){
        if let email = emailTF.text, let password = passwordTF.text{
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if let e = error{
                    print(e.localizedDescription)
                } else {
                    //Navigate to ChatViewController
                    self.db.collection("users").document("\(Auth.auth().currentUser?.email)").setData([:])
                    print("Registered")
                    //self.performSegue(withIdentifier: "newChatSegue", sender: self)
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

//
//  ListOfUsersViewController.swift
//  navigation
//
//  Created by Nishant Thakur on 26/05/20.
//  Copyright © 2020 Nishant Thakur. All rights reserved.
//

import UIKit
import Firebase

class ListOfUsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let db = Firestore.firestore()
    var users = [String]()
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

       tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        loadUsers()
        
        // Do any additional setup after loading the view.
    }
    func loadUsers(){
        db.collection("users").getDocuments { (querySnapshot, error) in
            if error != nil{
                print(error)
            }else{
                for document in querySnapshot!.documents{
                    print("\("\(Auth.auth().currentUser?.email)")")
                    if document.documentID != "\("\(Auth.auth().currentUser?.email)")"{
                        self.users.append(document.documentID)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                    
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
extension ListOfUsersViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(users)
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.emailLabel.text = users[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let otherUserLocationVC = navigationController?.storyboard?.instantiateViewController(identifier: "seeOtherUserLocationViewController") as! seeOtherUserLocationViewController
        otherUserLocationVC.email = users[indexPath.row]
        navigationController?.pushViewController(otherUserLocationVC, animated: true)
    }
}

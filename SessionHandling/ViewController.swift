//
//  ViewController.swift
//  SessionHandling
//
//  Created by shubhan.langade on 02/03/23.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        print(Auth.auth().currentUser?.email ?? "nil")
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            if error == nil{
                UserDefaults.standard.set(true, forKey: "isLogin")
                print("Login Successful!")
                let dashboardVC = self?.storyboard?.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
                self?.navigationController?.pushViewController(dashboardVC, animated: true)
            }else{
                print(error?.localizedDescription ?? "error")
            }
          // ...
        }
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        let signupVc = storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        navigationController?.pushViewController(signupVc, animated: true)
    }
}


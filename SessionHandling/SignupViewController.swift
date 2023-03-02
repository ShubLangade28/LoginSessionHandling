//
//  SignupViewController.swift
//  SessionHandling
//
//  Created by shubhan.langade on 02/03/23.
//

import UIKit
import FirebaseAuth

class SignupViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { authResult, error in
            if error == nil{
              print("Signup Successful!")
                self.navigationController?.popViewController(animated: true)
            }else{
                print(error!)
            }
          // ...
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
